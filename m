From: Lee Jones <lee.jones@linaro.org>
Subject: Re: linux-next: build failure after merge of the mfd-lj tree
Date: Mon, 3 Mar 2014 15:23:31 +0800
Message-ID: <20140303072331.GB4674@lee--X1>
References: <20140214134217.aa7e1994b4cab7ee563c8307@canb.auug.org.au>
 <20140217141446.454ab86eb19621fd397be6ed@canb.auug.org.au>
 <20140220150508.79bfff95fb5d93c651801ffd@canb.auug.org.au>
 <20140225143246.914c9732966764234bc51de2@canb.auug.org.au>
 <20140303161803.ecbd9b124b5f2cdf79b8cf51@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20140303161803.ecbd9b124b5f2cdf79b8cf51@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Hi Stephen,

> > > > > After merging the mfd-lj tree, today's linux-next build (x86_=
64
> > > > > allmodconfig) failed like this:
> > > > >=20
> > > > > In file included from drivers/mfd/max665x.c:19:0:
> > > > > include/linux/mfd/max665x-private.h:31:1: error: expected ';'=
, identifier or '(' before 'struct'
> > > > >  struct max665x_dev {
> > > > >  ^
> > > > >=20
> > > > > Caused by commit e77bb5297293 ("mfd: max665x: Differentiate b=
etween
> > > > > MAX665X devices").  Clearly never built by anyone :-(
> > > > >=20
> > > > > I have used the mfd-lj tree from next-20140210 again for toda=
y (since the
> > > > > other version had other problems).
> > > >=20
> > > > Still seeing this error.
> > >=20
> > > Still ...
> >=20
> > Ping ...
>=20
> I am still seeing this error which means that I am still using the
> version of your tree from next-20140210 i.e. Feb 10.  It is a bit
> disappointing that his has not been fixed in such a long time even th=
ough
> there have been other updates to your tree which means that those oth=
er
> changes have received no exposure in linux-next.  It is a trivial err=
or,
> but it does indicate that noone ever build tested that particular com=
mit.
>=20
> (this is now commit 2fc7e7d25bee in your tree since it was rewritten =
but
> not fixed on Feb 14.)

Sorry about all this. Your mails are being filtered into an unused
mailbox for a currently unknown reason. I will investigate this
immediately. It was a mistake to push this patch, I will rectify right
away.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
