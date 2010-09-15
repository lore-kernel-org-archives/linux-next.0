From: Mihai =?utf-8?q?Don=C8=9Bu?= <mihai.dontu@gmail.com>
Subject: Re: linux-next: build failure after merge of the usb tree
Date: Wed, 15 Sep 2010 16:21:56 +0300
Message-ID: <201009151621.57402.mihai.dontu@gmail.com>
References: <20100914125431.1603ffd1.sfr@canb.auug.org.au> <20100914040803.GB11972@kroah.com> <20100914142528.1810936b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.bitdefender.com ([91.199.104.2]:57243 "EHLO
	mail.bitdefender.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752677Ab0ION2l (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 15 Sep 2010 09:28:41 -0400
In-Reply-To: <20100914142528.1810936b.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, David Brownell <dbrownell@users.sourceforge.net>

On Tuesday 14 September 2010 07:25:28 Stephen Rothwell wrote:
> Hi Greg,
>=20
> On Mon, 13 Sep 2010 21:08:03 -0700 Greg KH <greg@kroah.com> wrote:
> > On Tue, Sep 14, 2010 at 12:54:31PM +1000, Stephen Rothwell wrote:
> > > Hi Greg,
> > >=20
> > > After merging the usb tree, today's linux-next build (x86_64
> > > allmodconfig) failed like this:
> > >=20
> > > In file included from drivers/usb/gadget/ether.c:123:
> > > drivers/usb/gadget/rndis.c: In function 'rndis_init':
> > > drivers/usb/gadget/rndis.c:1163: error: expected ';' before 'if'
> > >=20
> > > Caused by commit c8feb3bad134f927a624cc19da13f57627b905e2 ("USB:
> > > gadget: rndis: fix up coding style issues in the file").
> > >=20
> > > I used the version of the usb tree from next-20100913 for today.
> >=20
> > I can't duplicate this at all, are you sure it's coming from my tre=
e?
> > What is your .config here?
>=20
> See above: that was an x86_64 allmodconfig build.  You need
> CONFIG_USB_GADGET_DEBUG_FILES set.
>=20
> The patch above was not in your usb quilt series when I fetched it
> yesterday and it was there this morning.  The relevant hunk of the pa=
tch
> looks like this:
>=20
> @@ -1160,42 +1158,40 @@ int rndis_init(void)
>  #ifdef	CONFIG_USB_GADGET_DEBUG_FILES
>  		char name [20];
>=20
> -		sprintf (name, NAME_TEMPLATE, i);
> -		if (!(rndis_connect_state [i]
> -				=3D proc_create_data(name, 0660, NULL,
> +		sprintf(name, NAME_TEMPLATE, i);
> +		rndis_connect_state[i] =3D proc_create_data(name, 0660, NULL,
>  					&rndis_proc_fops,
> -					(void *)(rndis_per_dev_params + i))))
> -		{
> -			pr_debug("%s :remove entries", __func__);
> +					(void *)(rndis_per_dev_params + i))
>                                                                      =
    =20
> ^ *** note missing semicolon ...
>=20
> +		if (!rndis_connect_state[i]) {
> +			pr_debug("%s: remove entries", __func__);
>  			while (i) {
> -				sprintf (name, NAME_TEMPLATE, --i);
> -				remove_proc_entry (name, NULL);
> +				sprintf(name, NAME_TEMPLATE, --i);
> +				remove_proc_entry(name, NULL);
>  			}
>  			pr_debug("\n");
>  			return -EIO;

I'm to blame for that. I'm sorry. I'll do an allmodconfig too, next tim=
e=20
(besides being extra careful).

Thanks,

--=20
Mihai Don=C8=9Bu
