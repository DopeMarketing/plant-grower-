-- Create plants table
CREATE TABLE IF NOT EXISTS plants (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE,
  name TEXT NOT NULL,
  species TEXT,
  location TEXT,
  watering_frequency_days INTEGER DEFAULT 7,
  sunlight_hours_needed INTEGER DEFAULT 6,
  soil_type TEXT,
  notes TEXT,
  image_url TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Create care_logs table for tracking plant care activities
CREATE TABLE IF NOT EXISTS care_logs (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  plant_id UUID REFERENCES plants(id) ON DELETE CASCADE,
  user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE,
  care_type TEXT NOT NULL CHECK (care_type IN ('watering', 'sunlight', 'soil_check', 'fertilizing', 'pruning')),
  notes TEXT,
  sunlight_hours INTEGER,
  soil_condition TEXT CHECK (soil_condition IN ('dry', 'moist', 'wet', 'soggy')),
  logged_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Create care_reminders table for scheduling reminders
CREATE TABLE IF NOT EXISTS care_reminders (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  plant_id UUID REFERENCES plants(id) ON DELETE CASCADE,
  user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE,
  reminder_type TEXT NOT NULL CHECK (reminder_type IN ('watering', 'fertilizing', 'soil_check')),
  next_due_date DATE NOT NULL,
  frequency_days INTEGER NOT NULL,
  is_active BOOLEAN DEFAULT TRUE,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Add Row Level Security (RLS)
ALTER TABLE plants ENABLE ROW LEVEL SECURITY;
ALTER TABLE care_logs ENABLE ROW LEVEL SECURITY;
ALTER TABLE care_reminders ENABLE ROW LEVEL SECURITY;

-- Create policies for plants table
CREATE POLICY "Users can view their own plants" ON plants
  FOR SELECT USING (auth.uid() = user_id);

CREATE POLICY "Users can insert their own plants" ON plants
  FOR INSERT WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can update their own plants" ON plants
  FOR UPDATE USING (auth.uid() = user_id);

CREATE POLICY "Users can delete their own plants" ON plants
  FOR DELETE USING (auth.uid() = user_id);

-- Create policies for care_logs table
CREATE POLICY "Users can view their own care logs" ON care_logs
  FOR SELECT USING (auth.uid() = user_id);

CREATE POLICY "Users can insert their own care logs" ON care_logs
  FOR INSERT WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can update their own care logs" ON care_logs
  FOR UPDATE USING (auth.uid() = user_id);

CREATE POLICY "Users can delete their own care logs" ON care_logs
  FOR DELETE USING (auth.uid() = user_id);

-- Create policies for care_reminders table
CREATE POLICY "Users can view their own care reminders" ON care_reminders
  FOR SELECT USING (auth.uid() = user_id);

CREATE POLICY "Users can insert their own care reminders" ON care_reminders
  FOR INSERT WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can update their own care reminders" ON care_reminders
  FOR UPDATE USING (auth.uid() = user_id);

CREATE POLICY "Users can delete their own care reminders" ON care_reminders
  FOR DELETE USING (auth.uid() = user_id);

-- Create indexes for better performance
CREATE INDEX idx_plants_user_id ON plants(user_id);
CREATE INDEX idx_care_logs_plant_id ON care_logs(plant_id);
CREATE INDEX idx_care_logs_user_id ON care_logs(user_id);
CREATE INDEX idx_care_logs_logged_at ON care_logs(logged_at);
CREATE INDEX idx_care_reminders_user_id ON care_reminders(user_id);
CREATE INDEX idx_care_reminders_next_due_date ON care_reminders(next_due_date);

-- Create function to update updated_at timestamp
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ language 'plpgsql';

-- Create triggers to automatically update updated_at
CREATE TRIGGER update_plants_updated_at BEFORE UPDATE ON plants
  FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_care_reminders_updated_at BEFORE UPDATE ON care_reminders
  FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();