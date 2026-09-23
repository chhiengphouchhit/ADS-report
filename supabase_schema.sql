-- ======================================================================
-- Supabase SQL Schema for PSIS x ELIF x AYLA Boosting Report System
-- Run this in your Supabase SQL Editor:
-- https://supabase.com/dashboard/project/jotjpvgjzeqrlqjtjets/sql/new
-- ======================================================================

-- 1. Create the boosts table
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

-- 3. Create RLS Policies allowing full read/write for the frontend application
DROP POLICY IF EXISTS "Allow public full access" ON public.boosts;
CREATE POLICY "Allow public full access" ON public.boosts
FOR ALL
USING (true)
WITH CHECK (true);

-- 4. Enable Realtime updates
ALTER PUBLICATION supabase_realtime ADD TABLE public.boosts;
