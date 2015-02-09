From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: linux-next: build failure after merge of the pm tree
Date: Mon, 09 Feb 2015 04:19:33 +0100
Message-ID: <38500087.9UIeKqQhFX@vostro.rjw.lan>
References: <20150209132642.0d61b6ed@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2185158.YpmUmfA9qJ"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from v094114.home.net.pl ([79.96.170.134]:49179 "HELO
	v094114.home.net.pl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1751552AbbBIC4j (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 8 Feb 2015 21:56:39 -0500
In-Reply-To: <20150209132642.0d61b6ed@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Jiang Liu <jiang.liu@linux.intel.com>


--nextPart2185158.YpmUmfA9qJ
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Monday, February 09, 2015 01:26:42 PM Stephen Rothwell wrote:
> Hi Rafael,
>=20
> After merging the pm tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
>=20
> In file included from drivers/of/of_pci.c:1:0:
> drivers/of/of_pci.c: In function 'of_pci_get_host_bridge_resources':
> include/linux/list.h:447:43: error: dereferencing pointer to incomple=
te type
>   for (pos =3D list_first_entry(head, typeof(*pos), member); \
>                                            ^

[cut]

>=20
> Caused by commit 14d76b68f281 ("PCI: Use common resource list
> management code instead of private implementation") interacting with
> commit d2be00c0fb5a ("of/pci: Free resources on failure in
> of_pci_get_host_bridge_resources()") from the pci tree.

Thanks for identifying this!

> I applied the following merge fix patch (which may need more work?).
> Someone needs to remember to tell Linus about this fix (or similar)
> when these trees get merged.

The patch looks correct to me, so I did the following.

I pulled the Bjorn's pci/host-generic branch that contained just that o=
ne
commit which conflicted with the Gerry's one into my acpi-resources bra=
nch
and folded the patch below into the merge.

> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 9 Feb 2015 13:08:24 +1100
> Subject: [PATCH] of/pci: fix up for "PCI: Use common resource list ma=
nagement
>  code instead of private implementation"
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/of/of_pci.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/of/of_pci.c b/drivers/of/of_pci.c
> index 60dc36c865b5..110fece2ff53 100644
> --- a/drivers/of/of_pci.c
> +++ b/drivers/of/of_pci.c
> @@ -140,7 +140,7 @@ int of_pci_get_host_bridge_resources(struct devic=
e_node *dev,
>  =09=09=09unsigned char busno, unsigned char bus_max,
>  =09=09=09struct list_head *resources, resource_size_t *io_base)
>  {
> -=09struct pci_host_bridge_window *window;
> +=09struct resource_entry *window;
>  =09struct resource *res;
>  =09struct resource *bus_range;
>  =09struct of_pci_range range;
> @@ -226,7 +226,7 @@ int of_pci_get_host_bridge_resources(struct devic=
e_node *dev,
>  conversion_failed:
>  =09kfree(res);
>  parse_failed:
> -=09list_for_each_entry(window, resources, list)
> +=09resource_list_for_each_entry(window, resources)
>  =09=09kfree(window->res);
>  =09pci_free_resource_list(resources);
>  =09kfree(bus_range);
>=20

=2D-=20
I speak only for myself.
Rafael J. Wysocki, Intel Open Source Technology Center.
--nextPart2185158.YpmUmfA9qJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAABCAAGBQJU2CdLAAoJEILEb/54YlRxxd0P/iXYnLYS3rS6/zQitryLku15
AJhlnoLAq/Zepn5LBJ62o3DFyOpQ8T7NSRHU4cEKjoQcuI8cQ72n3iF6GP4IioyD
aHfx0lw0abRjKNe4bt/ipaVzthNxRcyo5+jWoY3hAtPwEAa2EcGG5iBlpUdpwimC
PzUmxFVO2nwGGHb1nG3L4E9udXmQrZqsQ6oeeWJ3ceBhx1NOIur5UNn2Bcblmhz+
lI7GjJPK64gGmhRnR0FMOXh5yWpQ71zG7QkVOWl8SIHLTqwet1JGsfsjjEd2AiZX
HKnsDlPDYcmIQWAem+7hbL4Zgh2A1jb81UsSbGAxd5TCKAr1HDyhdi/JxPw7gLla
SsCXuvkg69WPjYz7CVXfleY+i4cD2e6zohxdkCcQwYwZXncCu2RP/HNaCK7v9vcp
Po+vut5DGaVkBi6TljNpS/12euJYBO7OKmuBezw7XeGrWjEHSDLLQ4VzRCEC7kDQ
N4d9mbW5PWJ24KdVEHHEjqhZwnCplwmzD352GVodaBVGarIlRNH8ptlqE91UdkHo
WI3N15m4dMcm4e7JyA21n+WYw+8a9NR9RzqfgPP9SIcwOzwWsIo6wvr3laEUOA3t
HxeMnYNcH5Ft+PKWYlICFh7gysEnZHOgZBSLRoCp8s4DjSeAkq6Olt/caTf04Q6F
3bpxNfjsQ/1FBXbgZnKz
=l1FK
-----END PGP SIGNATURE-----

--nextPart2185158.YpmUmfA9qJ--
