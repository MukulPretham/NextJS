/*
  Warnings:

  - Changed the type of `status` on the `Invoices` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `month` on the `Revenue` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.

*/
-- AlterTable
ALTER TABLE "Invoices" DROP COLUMN "status",
ADD COLUMN     "status" TEXT NOT NULL,
ALTER COLUMN "date" SET DATA TYPE TEXT;

-- AlterTable
ALTER TABLE "Revenue" DROP COLUMN "month",
ADD COLUMN     "month" TEXT NOT NULL;

-- DropEnum
DROP TYPE "Status";
