From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: suspend tree build warnings
Date: Wed, 19 Aug 2009 16:36:01 -0700
Message-ID: <20090819233601.GA2875@kroah.com>
References: <20090819172419.2cf53008.sfr@canb.auug.org.au>
 <200908192338.03910.rjw@sisk.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1754086AbZHSXjv@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200908192338.03910.rjw@sisk.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, pm list <linux-pm@lists.linux-foundation.org>, Alan Stern <stern@rowland.harvard.edu>, Mauro Carvalho Chehab <mchehab@infradead.org>, linux-media@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Wed, Aug 19, 2009 at 11:38:03PM +0200, Rafael J. Wysocki wrote:
> On Wednesday 19 August 2009, Stephen Rothwell wrote:
> > Hi Rafael,
>=20
> Hi,
>=20
> > Today's linux-next build (x86_64 allmodconfig) produced these warni=
ngs:
> >=20
> > drivers/media/dvb/frontends/dib7000p.c: In function =E2=80=98dib700=
0p_i2c_enumeration=E2=80=99:
> > drivers/media/dvb/frontends/dib7000p.c:1315: warning: the frame siz=
e of 2256 bytes is larger than 2048 bytes
> > drivers/media/dvb/frontends/dib3000mc.c: In function =E2=80=98dib30=
00mc_i2c_enumeration=E2=80=99:
> > drivers/media/dvb/frontends/dib3000mc.c:853: warning: the frame siz=
e of 2160 bytes is larger than 2048 bytes
> >=20
> > Introduced by commit 99307958cc9c1b0b2e0dad4bbefdafaf9ac5a681 ("PM:
> > Introduce core framework for run-time PM of I/O devices (rev. 17)")=
=2E
>=20
> Well.
>=20
> This commit increases the size of struct device quite a bit and both =
of the
> drivers above create a "state" object on the stack that contains stru=
ct device
> among other things.

Ick.  struct device should _never_ be on the stack, why would this code
want to do such a thing?

thanks,

greg k-h
