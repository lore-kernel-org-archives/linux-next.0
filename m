From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: linux-next: manual merge of the pm tree with the i2c tree
Date: Fri, 15 Jul 2016 14:59:49 +0200
Message-ID: <2196027.ndrBocBl2R@vostro.rjw.lan>
References: <20160715121723.0f21f148@canb.auug.org.au> <2993186.kRkeiY7GfT@vostro.rjw.lan> <20160715123253.GB2620@tetsubishi>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2202492.lesdHG4iUM"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160715123253.GB2620@tetsubishi>
Sender: linux-kernel-owner@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Octavian Purdila <octavian.purdila@intel.com>, Jarkko Nikula <jarkko.nikula@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>
List-Id: linux-next.vger.kernel.org


--nextPart2202492.lesdHG4iUM
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Friday, July 15, 2016 09:32:54 PM Wolfram Sang wrote:
> On Fri, Jul 15, 2016 at 02:19:28PM +0200, Rafael J. Wysocki wrote:
> > On Friday, July 15, 2016 12:28:53 PM Stephen Rothwell wrote:
> > > Hi all,
> > > 
> > > On Fri, 15 Jul 2016 12:17:23 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > > >
> > > > I fixed it up (I think, but it needs more work - see below) and can
> > > 
> > > For a start, it generates this warning, now:
> > > 
> > > drivers/i2c/i2c-core.c:269:20: warning: 'i2c_acpi_add_device' defined but not used [-Wunused-function]
> > > static acpi_status i2c_acpi_add_device(acpi_handle handle, u32 level,
> > >                    ^
> > 
> > OK, thanks for the heads-up.
> 
> Yes, thanks!
> 
> > 
> > Wolfram, what about if I exposed my "acpi-tables" branch for you to pull?
> > 
> > You could resolve this in your tree then.
> 
> I can pull it in, sure. For the fixup, I'd like a commitment from one of
> the ACPI experts (Jarkko, Mika, Andy), though. Otherwise I'd need to
> revert given that we are quite late in the cycle already.

The branch is here:

 git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git acpi-tables

The top-most commit is:

fafe5306f201 ACPI: Rename configfs.c to acpi_configfs.c to prevent link error

I won't rebase this branch going forward, so it is safe to pull.

Please let me know how I can help with the conflict resolution.

Thanks,
Rafael

--nextPart2202492.lesdHG4iUM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAABCAAGBQJXiN5LAAoJEILEb/54YlRxYV4P/0ZlHq4/E0YLiJx6G8+dAKVu
O+f5b8ujzt3f+Am3ibVcwW5NMzS9iFDoTXAn6YeSJY2KiSTdlz7+8uCNJhdVebUM
4Xp+JlClw8zsD3h3UfP2orxO1muqbWITErYvj/wK2RFCGlgYIXysnqMurPI4mUsF
JHqGxR2iM8qPC+9e97/M6WW/vLMyrYLO5hhgrY/Xo9NIlCGZEDOrvEGMaXFvw3nW
XMomVPp0isvlYmz01JlG08LdZXPCeAF0X4tTEUTmlHqD0BrOO9NfWNy682o0dnSr
yVq+eNX847y8doV+SpWUl3m/t2uMIlCl0WVIUiJyKKG9/jssFLfjyVijR+op8fe2
EU3X8xNE+AsRFwLeB1Sllyn6wBwP23uXXxT8T89onwc27PRlABdk/52I42CyrMnu
xE20bB/2raoY/2BcGlBJc4ZBfoGNsmQevhWHak5yTxeOxMJigbeHQLisTkS2h4Bq
1LkrwksXpZpbhrRC28GczpIUUOND6WRfXmpTF2ib/oW9tkHfgZUpxrWAbBVPdkg4
ECFDk0wIDx36Npndmsfr8CKxhJNB/W87w84dGqIu0B+8YXmi9HM6yjPcpZEnsera
+VObVqmFfPymalQPeCMLk3t6UN5rfGHKlHRyW62IkncmzCs9aws8AU7OBWYtCGxV
iimjALXi06yQAVJff3uv
=BTmt
-----END PGP SIGNATURE-----

--nextPart2202492.lesdHG4iUM--
