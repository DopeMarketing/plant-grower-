import Link from 'next/link'

export default function HomePage() {
  return (
    <div className="min-h-screen bg-gradient-to-b from-green-50 to-white">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <nav className="py-6 flex justify-between items-center">
          <h1 className="text-2xl font-bold text-green-800">Plant Grower</h1>
          <div className="space-x-4">
            <Link
              href="/login"
              className="text-green-700 hover:text-green-900 font-medium"
            >
              Login
            </Link>
            <Link
              href="/signup"
              className="bg-green-600 text-white px-4 py-2 rounded-lg hover:bg-green-700 transition-colors"
            >
              Sign Up
            </Link>
          </div>
        </nav>

        <main className="py-20">
          <div className="text-center">
            <h2 className="text-5xl font-bold text-gray-900 mb-6">
              Keep Your Plants Happy & Healthy
            </h2>
            <p className="text-xl text-gray-600 mb-8 max-w-3xl mx-auto">
              Track watering schedules, monitor sunlight exposure, and maintain optimal soil conditions 
              for all your houseplants in one simple app.
            </p>
            <div className="space-x-4">
              <Link
                href="/signup"
                className="bg-green-600 text-white px-8 py-3 rounded-lg text-lg font-medium hover:bg-green-700 transition-colors inline-block"
              >
                Start Growing
              </Link>
              <Link
                href="/login"
                className="border-2 border-green-600 text-green-600 px-8 py-3 rounded-lg text-lg font-medium hover:bg-green-50 transition-colors inline-block"
              >
                I Have Plants
              </Link>
            </div>
          </div>

          <div className="mt-20 grid md:grid-cols-3 gap-8">
            <div className="text-center p-6">
              <div className="w-16 h-16 bg-blue-100 rounded-full flex items-center justify-center mx-auto mb-4">
                <svg className="w-8 h-8 text-blue-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M19.428 15.428a2 2 0 00-1.022-.547l-2.387-.477a6 6 0 00-3.86.517l-.318.158a6 6 0 01-3.86.517L6.05 15.21a2 2 0 00-1.806.547M8 4h8l-1 1v5.172a2 2 0 00.586 1.414l5 5c1.26 1.26.367 3.414-1.415 3.414H4.828c-1.782 0-2.674-2.154-1.414-3.414l5-5A2 2 0 009 8.172V5L8 4z" />
                </svg>
              </div>
              <h3 className="text-xl font-semibold mb-2">Smart Watering</h3>
              <p className="text-gray-600">Track when you water each plant and get reminders when it's time again.</p>
            </div>

            <div className="text-center p-6">
              <div className="w-16 h-16 bg-yellow-100 rounded-full flex items-center justify-center mx-auto mb-4">
                <svg className="w-8 h-8 text-yellow-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M12 3v1m0 16v1m9-9h-1M4 12H3m15.364 6.364l-.707-.707M6.343 6.343l-.707-.707m12.728 0l-.707.707M6.343 17.657l-.707.707M16 12a4 4 0 11-8 0 4 4 0 018 0z" />
                </svg>
              </div>
              <h3 className="text-xl font-semibold mb-2">Sunlight Monitoring</h3>
              <p className="text-gray-600">Log daily sunlight hours to ensure your plants get the light they need.</p>
            </div>

            <div className="text-center p-6">
              <div className="w-16 h-16 bg-green-100 rounded-full flex items-center justify-center mx-auto mb-4">
                <svg className="w-8 h-8 text-green-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" />
                </svg>
              </div>
              <h3 className="text-xl font-semibold mb-2">Soil Health</h3>
              <p className="text-gray-600">Monitor soil moisture and condition to maintain optimal growing environment.</p>
            </div>
          </div>
        </main>
      </div>
    </div>
  )
}