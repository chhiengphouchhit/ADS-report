# 🚀 PSIS × ELIF × AYLA — Social Media Boosting Report System

ប្រព័ន្ធគ្រប់គ្រង និងតាមដានរបាយការណ៍ប៊ូសផេក (Social Media Performance Report) សម្រាប់ស្ថាប័នអប់រំ **PSIS**, **ELIF**, និង **AYLA** ដែលបែងចែកជា ៣ ប្រឡោះតាមឈ្មោះអ្នកទទួលបន្ទុក៖ **Devit | candy | Chhit**។

---

## 🌐 គេហទំព័រផ្សាយផ្ទាល់ (Live Hosting on GitHub Pages)
👉 **[https://chhiengphouchhit.github.io/ADS-report/](https://chhiengphouchhit.github.io/ADS-report/)**

---

## ☁️ Supabase Cloud Backend Configuration

ប្រព័ន្ធនេះប្រើប្រាស់ **Supabase** ជា Real-time Cloud Database និង Backend ដើម្បី Sync ទិន្នន័យរវាងសមាជិកក្រុមទាំងអស់ដោយស្វ័យប្រវត្ត។

- **Project Ref**: `jotjpvgjzeqrlqjtjets`
- **Dashboard**: [https://supabase.com/dashboard/project/jotjpvgjzeqrlqjtjets](https://supabase.com/dashboard/project/jotjpvgjzeqrlqjtjets)
- **Supabase URL**: `https://jotjpvgjzeqrlqjtjets.supabase.co`

### 📋 របៀបបង្កើត Table ក្នុង Supabase (SQL Setup)
សូមបើក **[Supabase SQL Editor](https://supabase.com/dashboard/project/jotjpvgjzeqrlqjtjets/sql/new)** រួច Copy & Paste កូដ SQL ខាងក្រោមនេះដើម្បីបង្កើត Table `boosts`:

```sql
-- 1. Create boosts table
CREATE TABLE IF NOT EXISTS public.boosts (
    id TEXT PRIMARY KEY,
    person TEXT NOT NULL,          -- Devit, candy, Chhit
    brand TEXT NOT NULL,           -- PSIS, ELIF, AYLA, AYLA × PSIS
    title TEXT NOT NULL,
    platform TEXT DEFAULT 'Facebook',
    objective TEXT DEFAULT 'Messages',
    target_audience TEXT,
    budget NUMERIC(10,2) DEFAULT 0,
    spent NUMERIC(10,2) DEFAULT 0,
    reach BIGINT DEFAULT 0,
    impressions BIGINT DEFAULT 0,
    results BIGINT DEFAULT 0,
    cpr NUMERIC(10,2) DEFAULT 0,
    start_date DATE,
    end_date DATE,
    status TEXT DEFAULT 'Completed',
    post_url TEXT,
    image_url TEXT,
    notes TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- 2. Enable Row Level Security (RLS)
ALTER TABLE public.boosts ENABLE ROW LEVEL SECURITY;

-- 3. Create public access policy
DROP POLICY IF EXISTS "Allow public full access" ON public.boosts;
CREATE POLICY "Allow public full access" ON public.boosts
FOR ALL
USING (true)
WITH CHECK (true);

-- 4. Enable Realtime updates
ALTER PUBLICATION supabase_realtime ADD TABLE public.boosts;
```

---

## ✨ លក្ខណៈពិសេសសំខាន់ៗ (Key Features)

1. **ការបែងចែកជា ៣ ប្រឡោះតាមឈ្មោះ (3-Column Board)**
   - ប្រឡោះទី ១៖ **Devit** (Boost Specialist)
   - ប្រឡោះទី ២៖ **candy** (Ads & Content Strategist)
   - ប្រឡោះទី ៣៖ **Chhit** (Creative & Media Lead)
   - គណនាតួលេខ Spent ($), Reach, Inbox/Leads, និង CPR ដាច់ដោយឡែកពីគ្នា។

2. **ស្កេនរូបភាពដោយស្វ័យប្រវត្តពី Screenshot (`Ctrl + V`)**
   - គ្រាន់តែថត Screenshot ពី Facebook / Meta Ads Manager រួចចុច `Ctrl + V`
   - AI OCR នឹងទាញយកតួលេខ Spent, Budget, Results, CPR, Dates, Brand មកបំពេញក្នុង Form ភ្លាមៗ។

3. **ជម្រើស Brand ចំនួន ៣ (PSIS | ELIF | AYLA)**
   - 🏛️ **PSIS** (Paris School of International Studies)
   - 💎 **ELIF** (អមដោយ Badge ពណ៌ Emerald/Teal)
   - 🌟 **AYLA** (Australia Young Leaders Academy)

4. **Calendar ផ្លូវកាត់ & Filter មើលតាមខែឆ្នាំ**
   - ផ្លូវកាត់រហ័ស៖ ថ្ងៃនេះ (Today), ម្សិលមិញ (Yesterday), ៧ ថ្ងៃចុងក្រោយ, ៣០ ថ្ងៃចុងក្រោយ, ខែនេះ, ខែមុន
   - ជ្រើសរើសមើលតាមឆ្នាំ (2024, 2025, 2026, 2027) និងខែ (មករា ដល់ ធ្នូ)។

5. **ប្រព័ន្ធ Memory រក្សាទុកជាប់ជានិច្ច (Realtime Cloud Sync)**
   - Cloud Supabase + Local Storage + Backup/Restore JSON
   - មិនបាត់បង់ទិន្នន័យទោះបី Reload ឬបិទ Browser។
