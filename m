From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH -next] staging/cxt1e1: Convert bare printks to
 pr_<level>
Date: Wed, 5 May 2010 09:21:01 -0700
Message-ID: <20100505162101.GA12809@kroah.com>
References: <20100503151619.f75e3a80.sfr@canb.auug.org.au>
 <20100503110657.00b4e140.randy.dunlap@oracle.com>
 <1272915196.30040.163.camel@Joe-Laptop.home>
 <201005051421.14647.PeterHuewe@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <201005051421.14647.PeterHuewe@gmx.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter =?iso-8859-1?Q?H=FCwe?= <PeterHuewe@gmx.de>
Cc: devel@linuxdriverproject.org, Joe Perches <joe@perches.com>, Randy Dunlap <randy.dunlap@oracle.com>, devel@driverdev.osuosl.org, Stephen Rothwell <sfr@canb.auug.org.au>, gregkh@suse.de, support@sbei.com, LKML <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org, support@onestopsystems.com
List-Id: linux-next.vger.kernel.org

On Wed, May 05, 2010 at 02:21:14PM +0200, Peter H=FCwe wrote:
> Am Montag 03 Mai 2010 21:33:16 schrieb Joe Perches:
> > Added #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> > A few line splits for long arguments
> > A couple of embedded function names converted to "%s", __func__
> > Removed some uses of THIS_MODULE->name
> >=20
> > Signed-off-by: Joe Perches <joe@perches.com>
>=20
> Hi,=20
> I applied Joe's patch, but unfortunately it misses out one part of Ra=
ndy's=20
> original patch, i.e. the conversion in line 286 of hwprobe.c.
>=20
> Joe: Can you perhaps add this to your patch?

I've already applied Joe's patch, so I'll queue up yours as well.

thanks,

greg k-h
