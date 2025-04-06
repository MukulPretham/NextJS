/*
  Warnings:

  - The primary key for the `Invoices` table will be changed. If it partially fails, the table could be left without primary key constraint.

*/
-- AlterTable
ALTER TABLE "Invoices" DROP CONSTRAINT "Invoices_pkey",
ADD COLUMN     "Sno" SERIAL NOT NULL,
ADD CONSTRAINT "Invoices_pkey" PRIMARY KEY ("Sno");
