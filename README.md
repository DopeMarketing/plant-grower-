# Plant Grower

A simple plant care tracking app that helps users monitor and log essential care requirements for their houseplants. Track watering schedules, sunlight exposure, and soil conditions to maintain healthy plants.

## Features

- **Plant Management**: Add and manage individual plants with detailed information
- **Care Logging**: Log watering events, sunlight exposure, and soil conditions with timestamps
- **Smart Reminders**: Set up care reminders and notifications for consistent plant care
- **Health Monitoring**: Track plant health metrics over time

## Target Users

Indoor plant enthusiasts and beginners who want to develop consistent plant care habits and prevent plant neglect or overcare.

## Tech Stack

- **Frontend**: Next.js 15 with App Router, React 19, TypeScript
- **Styling**: Tailwind CSS
- **Backend**: Supabase (Auth & Database)
- **Database**: PostgreSQL with Row Level Security

## Getting Started

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd plant-grower
   ```

2. **Install dependencies**
   ```bash
   npm install
   ```

3. **Set up environment variables**
   ```bash
   cp .env.example .env.local
   ```
   
   Fill in your Supabase project credentials:
   - `NEXT_PUBLIC_SUPABASE_URL`: Your Supabase project URL
   - `NEXT_PUBLIC_SUPABASE_ANON_KEY`: Your Supabase anonymous key
   - `SUPABASE_SERVICE_ROLE_KEY`: Your Supabase service role key (for admin operations)

4. **Set up the database**
   
   Run the migration file in your Supabase SQL editor:
   ```sql
   -- Copy and run the contents of supabase/migrations/001_initial.sql
   ```

5. **Start the development server**
   ```bash
   npm run dev
   ```

6. **Open your browser**
   
   Navigate to [http://localhost:3000](http://localhost:3000)

## Database Schema

### Plants Table
- Plant information (name, species, location)
- Care requirements (watering frequency, sunlight needs)
- User notes and images

### Care Logs Table
- Track care activities (watering, sunlight, soil checks)
- Timestamps and detailed notes
- Soil condition monitoring

### Care Reminders Table
- Automated reminder system
- Customizable frequencies
- Active/inactive status

## Development

- **Build**: `npm run build`
- **Start**: `npm start` 
- **Lint**: `npm run lint`

## Success Metrics

- Daily active tracking sessions
- Plant survival rate improvement  
- User retention after 30 days

## Contributing

This is a personal project for plant care tracking. Feel free to fork and customize for your own needs.