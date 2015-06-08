From: Darren Hart <dvhart@infradead.org>
Subject: Re: linux-next: build failure after merge of the drivers-x86 tree
Date: Sun, 7 Jun 2015 21:27:33 -0700
Message-ID: <20150608042733.GA34635@fury.dvhart.com>
References: <20150604181308.16fbe6cf@canb.auug.org.au>
 <20150604175135.GA10262@potion.brq.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150604175135.GA10262@potion.brq.redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Thu, Jun 04, 2015 at 07:51:36PM +0200, Radim Kr=C4=8Dm=C3=A1=C5=99 w=
rote:
> 2015-06-04 18:13+1000, Stephen Rothwell:
> > After merging the drivers-x86 tree, today's linux-next build (x86_6=
4 allmodconfig)
> > failed like this:
> >=20
> > ERROR: "acpi_bus_get_status_handle" [drivers/platform/x86/pvpanic.k=
o] undefined!
> >=20
> > Caused by commit b8f8cf6b02b6 ("pvpanic: handle missing _STA correc=
tly").
>=20
> Classic, I only built with Y, sorry.

While I, as a rule, build with both. My apologies for letting this slip=
 through
into -next.

>=20
> acpi_bus_get_status_handle is not exported, so a simple solution woul=
d
> be to make it so.  Or it's possible to rewrite the patch in a way tha=
t
> uses current infrastructure.
>=20
> Would you prefer a patch to export it, a build fix on top of
> b8f8cf6b02b6 or a replacement patch?

I'll take the incremental below, but I will roll it into the existing o=
ne so
as not to break bisectability in Linus tree.

Thanks,

--=20
Darren Hart
Intel Open Source Technology Center
