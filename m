From: =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
Subject: Re: [PATCH -next] mmc: cb710 cleanups
Date: Sat, 6 Jun 2009 11:59:26 +0200
Message-ID: <20090606095926.GA5455@rere.qmqm.pl>
References: <20090605164104.3cebe18d.sfr@canb.auug.org.au> <4A295DD9.2050301@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1754290AbZFFJ7f@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4A295DD9.2050301@oracle.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Randy Dunlap <randy.dunlap@oracle.com>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Pierre Ossman <pierre@ossman.eu>
List-Id: linux-next.vger.kernel.org

Hello,

On Fri, Jun 05, 2009 at 11:03:05AM -0700, Randy Dunlap wrote:
> From: Randy Dunlap <randy.dunlap@oracle.com>
>=20
> - don't define DEBUG, just use CONFIG_CB710_DEBUG or CONFIG_MMC_DEBUG
> - fix printk format warnings
>=20
> In file included from drivers/mmc/host/cb710-mmc.h:13,
>                  from drivers/mmc/host/cb710-mmc.c:15:
> include/linux/cb710.h:14:1: warning: "DEBUG" redefined
> <command-line>: warning: this is the location of the previous definit=
ion
>=20
> drivers/mmc/host/cb710-mmc.c:222: warning: format '%d' expects type '=
int', but argument 4 has type 'size_t'
> drivers/mmc/host/cb710-mmc.c:222: warning: format '%d' expects type '=
int', but argument 6 has type 'size_t'

=46ixes for these warnings are already queued in Pierre's mailbox.=20
Should I Cc: linux-next from now on since the base patch went to linux-=
next?

Best Regards,
Micha=B3 Miros=B3aw
