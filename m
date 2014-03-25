From: Felipe Balbi <balbi@ti.com>
Subject: Re: linux-next: manual merge of the keystone tree with the arm-soc
 tree
Date: Mon, 24 Mar 2014 20:23:53 -0500
Message-ID: <20140325012353.GA25643@saruman.home>
References: <20140325105501.e63fcdd78d0d604b4e5309a1@canb.auug.org.au>
 <5330C703.5030705@ti.com>
Reply-To: balbi@ti.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1189873701980153452=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <5330C703.5030705@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Santosh Shilimkar <santosh.shilimkar@ti.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Jason Cooper <jason@lakedaemon.net>, Arnd Bergmann <arnd@arndb.de>, Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org
List-Id: linux-next.vger.kernel.org

--===============1189873701980153452==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1yeeQ81UyVL57Vl7"
Content-Disposition: inline

--1yeeQ81UyVL57Vl7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 24, 2014 at 08:00:03PM -0400, Santosh Shilimkar wrote:
> On Monday 24 March 2014 07:55 PM, Stephen Rothwell wrote:
> > Hi Santosh,
> >=20
> > Today's linux-next merge of the keystone tree got a conflict in
> > arch/arm/boot/dts/Makefile between commit ba5a37e52194 ("ARM: mvebu: Mo=
ve
> > kirkwood DT boards into mach-mvebu") from the arm-soc tree and commit
> > 400550ae7e77 ("ARM: dts: Build all keystone dt blobs") from the keystone
> > tree.
> >=20
> > I fixed it up (see below) and can carry the fix as necessary (no action
> > is required).
> >=20
> Looks fine. Thanks

wow, not even a mention of my original patch [1]. I also couldn't find
your patch [2] anywhere in the mailing list archives, not even google
could find it. The only place that commit was ever mentioned was this
very thread.

The patch I wrote was valid for v3.14-rc7 (the base where it was
written), I'd expect to, at a minimum, have a mention or a Reported-by
or at least see your patch in the mailing list.

Anyway, it's just a patch. Nevermind.

[1] http://marc.info/?l=3Dlinux-arm-kernel&m=3D139463982310448&w=3D2
[2] https://git.kernel.org/cgit/linux/kernel/git/ssantosh/linux-keystone.gi=
t/commit/?h=3Dnext&id=3D400550ae7e778302a45d2952ac75907903e2610c

--=20
balbi

--1yeeQ81UyVL57Vl7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJTMNqpAAoJEIaOsuA1yqREE/8P/15ozWPKmoYBcApaAP3iFKVr
YNMgzopVTxA5lxV001n1t+tPn/kiuGm9BC/ZpkeyvVapPiAvqU3QUelyO5RqVete
KO1JhXOOGolyOwy1WMIAx/n6nPHxpr3SVzmrpZS7GLaew6l6Ij4sbjkf7Kc09Jn7
QN29A4EM7Md6fY4wMsGAOJ0LXfWUJ86zZwTtN7Twlw2muOTYjgV2Tfe8pELLi2dv
wotmKqOK5wSn7fX4+G0WvmcoN8nlbr0Cn7jfF+sJVTXI+SoyyyS+OZcvxj7JKLsp
ok0qZo7hCMBz1qhQk/nO6kGT7tz3FyVcyD1NBzS2wfqSRA2A7VIYeiCHIg5wzhtm
LVn6WNsPCLYuasH5pPC5a5je29h+f4rzJfSQoWTL/iwii/O3aWLfmaGEpZaO8nq+
HMnMlbvvPeHrniN38IWqtCJ5+WZrMslyEblZ/7sm/irTKSYvIT0xB2xKvyRVzc4O
j0eExeCktWVo3QDu7edpHZYNN6eaXQ4q9m2nsXqor5NktwRFPd/KfmfVZWlX1qH5
IsYmn2pkBlwmm9T9f3ga72ftUNqxqHgsABndtu7VaDsg2bifqEkOr3I7rwEpw9qv
5FYuClwR3vneRhIx1xUH07bn9dTjnnDxDiNrgP5cp67DNxnimMQCukddtqqJrZLx
l4HE5G5TdXOuVdjlD8Ho
=/W4i
-----END PGP SIGNATURE-----

--1yeeQ81UyVL57Vl7--


--===============1189873701980153452==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============1189873701980153452==--
