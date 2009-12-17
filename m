From: Trond Myklebust <trond.myklebust-41N18TsMXrtuMpJDpNschA@public.gmane.org>
Subject: Re: [PATCH -next] nfs: fix ISO C90 warning
Date: Thu, 17 Dec 2009 16:58:13 -0500
Message-ID: <1261087093.4080.36.camel@localhost>
References: <20091215165309.58e98eea.sfr@canb.auug.org.au>
	 <20091216142334.6a0ba115.randy.dunlap@oracle.com>
	 <1261003219.13878.6.camel@localhost>
	 <20091216144700.34b80b4b.randy.dunlap@oracle.com>
	 <alpine.LFD.2.00.0912162355350.2755@localhost.localdomain>
	 <1261004497.13878.9.camel@localhost>
	 <2375c9f90912170200m12a5310cg90343c5c1081fbb8@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-nfs-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2375c9f90912170200m12a5310cg90343c5c1081fbb8-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-nfs-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?Am=E9rico?= Wang <xiyou.wangcong-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Randy Dunlap <randy.dunlap-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-nfs-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-next.vger.kernel.org

On Thu, 2009-12-17 at 18:00 +0800, Am=C3=A9rico Wang wrote:=20
> Hi,
> Check that currently all usages of RPC_DEBUG are the same,
> we can replace them all.
>=20
> What do you think about the attached patch?
>=20
> Sorry for attaching it, I have a bad mail environment here.
>=20
> Signed-off-by: WANG Cong <xiyou.wangcong-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Doesn't that approach instead lead to a lot of 'unreferenced variable'
warnings in the '#undef RPC_DEBUG' case?

Cheers
  Trond

--
To unsubscribe from this list: send the line "unsubscribe linux-nfs" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
