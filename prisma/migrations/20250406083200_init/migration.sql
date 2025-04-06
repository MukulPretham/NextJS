-- CreateEnum
CREATE TYPE "Status" AS ENUM ('pending', 'completed');

-- CreateTable
CREATE TABLE "Users" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,

    CONSTRAINT "Users_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Customers" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "image_url" TEXT NOT NULL,

    CONSTRAINT "Customers_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Invoices" (
    "customer_id" TEXT NOT NULL,
    "amount" INTEGER NOT NULL,
    "status" "Status" NOT NULL,
    "date" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Invoices_pkey" PRIMARY KEY ("customer_id")
);

-- CreateTable
CREATE TABLE "Revenue" (
    "S_no" SERIAL NOT NULL,
    "month" "Status" NOT NULL,
    "revenue" INTEGER NOT NULL,

    CONSTRAINT "Revenue_pkey" PRIMARY KEY ("S_no")
);

-- CreateIndex
CREATE UNIQUE INDEX "Users_email_key" ON "Users"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Customers_email_key" ON "Customers"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Customers_image_url_key" ON "Customers"("image_url");

-- AddForeignKey
ALTER TABLE "Invoices" ADD CONSTRAINT "Invoices_customer_id_fkey" FOREIGN KEY ("customer_id") REFERENCES "Customers"("id") ON DELETE CASCADE ON UPDATE CASCADE;
