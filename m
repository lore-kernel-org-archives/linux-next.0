From: Jesse Barnes <jbarnes@virtuousgeek.org>
Subject: Re: linux-next: manual merge of the pci tree
Date: Thu, 3 Jul 2008 17:13:01 -0700
Message-ID: <200807031713.01352.jbarnes@virtuousgeek.org>
References: <20080703121055.d6f49ae5.sfr@canb.auug.org.au> <200807031223.10287.jbarnes@virtuousgeek.org> <20080704100933.c39faef1.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from outbound-mail-10.bluehost.com ([69.89.17.210]:47401 "HELO
	outbound-mail-10.bluehost.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1752219AbYGDANS (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 3 Jul 2008 20:13:18 -0400
In-Reply-To: <20080704100933.c39faef1.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, David Howells <dhowells@redhat.com>

On Thursday, July 03, 2008 5:09 pm Stephen Rothwell wrote:
> Hi Jesse,
>
> On Thu, 3 Jul 2008 12:23:10 -0700 Jesse Barnes <jbarnes@virtuousgeek.org> 
wrote:
> > > Yes, Greg send him these patches earlier today :)
> >
> > Ok I guess I have to merge upstream into my linux-next tree then.  I've
> > really been trying to avoid that so far, but I guess it's time...
>
> Not really.  You just need to make the changes that are in Greg's patches
> and he will drop his version.  Basically, the just change every all
> references to ->bus_id to use dev_name() and any setting of bus_id (or
> pci_name) to use dev_set_name.

Yeah, I saw that I already had the dev_set_name commit in my linux-next 
branch, so I went ahead and made the change.  When master.kernel.org comes 
back I'll actually push it. :)

Jesse
