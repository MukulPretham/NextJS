import { Card } from '@/app/ui/dashboard/cards';
import RevenueChart from '@/app/ui/dashboard/revenue-chart';
import LatestInvoices from '@/app/ui/dashboard/latest-invoices';
import { lusitana } from '@/app/ui/fonts';
import { fetchRevenue,fetchLatestInvoices,fetchCardData } from '../lib/data';
import { LatestInvoice } from '../lib/definitions';
 
export default async function Page() {
    let revenue = await fetchRevenue();
    let latestInvoicesInitial = await fetchLatestInvoices();
    let latestInvoices: LatestInvoice[] = latestInvoicesInitial.map(entry=> ({
        id: entry.id.toString(),
        name: entry.customer.name,
        image_url: entry.customer.image_url,
        email: entry.customer.email,
        amount: entry.amount
    }));

    let { customerCountPromise, invoiceCountPromise, paid, pending} = await fetchCardData();

  return (
    <main>
      <h1 className={`${lusitana.className} mb-4 text-xl md:text-2xl`}>
        Dashboard
      </h1>
      <div className="grid gap-6 sm:grid-cols-2 lg:grid-cols-4">
        <Card title="Collected" value={paid} type="collected" />
        <Card title="Pending" value={pending} type="pending" />
        <Card title="Total Invoices" value={invoiceCountPromise} type="invoices" />
        <Card
          title="Total Customers"
          value={customerCountPromise}
          type="customers"
        />
      </div>
      <div className="mt-6 grid grid-cols-1 gap-6 md:grid-cols-4 lg:grid-cols-8">
        <RevenueChart revenue={revenue}  />
        <LatestInvoices latestInvoices={latestInvoices} />
      </div>
    </main>
  );
}