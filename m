From: Matthew Wilcox <willy@infradead.org>
Subject: Re: linux-next: build failure after merge of the xarray tree
Date: Mon, 11 Mar 2019 05:31:05 -0700
Message-ID: <20190311123105.GC19508@bombadil.infradead.org>
References: <20190221171332.262cf619@canb.auug.org.au>
 <20190221123440.GD17501@mtr-leonro.mtl.com>
 <20190311024434.GA19508@bombadil.infradead.org>
 <20190311121348.GD22862@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190311121348.GD22862@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jason Gunthorpe <jgg@mellanox.com>
Cc: Leon Romanovsky <leonro@mellanox.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Doug Ledford <dledford@redhat.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Mon, Mar 11, 2019 at 12:13:54PM +0000, Jason Gunthorpe wrote:
> > @@ -1059,14 +1050,14 @@ static int assign_client_id(struct ib_client *client)
> >  	 * to get the LIFO order. The extra linked list can go away if xarray
> >  	 * learns to reverse iterate.
> >  	 */
> > -	if (list_empty(&client_list))
> > +	if (list_empty(&client_list)) {
> >  		client->client_id = 0;
> > -	else
> > -		client->client_id =
> > -			list_last_entry(&client_list, struct ib_client, list)
> > -				->client_id;
> > -	ret = xa_alloc(&clients, &client->client_id, INT_MAX, client,
> > -		       GFP_KERNEL);
> > +	} else {
> > +		struct ib_client *last = list_last_entry(&client_list,
> > +				struct ib_client, list);
> > +		client->client_id = last->client_id + 1;
> 
> blank line after locals, but other wise these all looks fine.. 

Would you rather see this rendered as:

        if (list_empty(&client_list)) {
                client->client_id = 0;
        } else {
                struct ib_client *last; 

                last = list_last_entry(&client_list, struct ib_client, list);
                client->client_id = last->client_id + 1;
        }

or move the declaration of 'last' up to the top of the function?

> Should have started out with the xa_insert version above..

I didn't spot it until last night either ...
