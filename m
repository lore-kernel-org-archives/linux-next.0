From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: linux-next: build failure after merge of the omap_dss2 tree
Date: Tue, 25 Nov 2014 13:00:47 +0200
Message-ID: <5474615F.20407@ti.com>
References: <20141117190905.4e96294a@canb.auug.org.au>	<546B5D5A.8020304@ti.com> <CANq1E4SMLHmezfXSENSQ8xUaXptwA8YKQ9Nne=sDCB0gPkPLmA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="7SbroNTaIbo90i1sg8Jm47TX9hLgKk5fH"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CANq1E4SMLHmezfXSENSQ8xUaXptwA8YKQ9Nne=sDCB0gPkPLmA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: David Herrmann <dh.herrmann@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Luc Verhaegen <libv@skynet.be>, Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Grant Likely <grant.likely@linaro.org>
List-Id: linux-next.vger.kernel.org

--7SbroNTaIbo90i1sg8Jm47TX9hLgKk5fH
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 18/11/14 17:07, David Herrmann wrote:
> Hi
>=20
> On Tue, Nov 18, 2014 at 3:53 PM, Tomi Valkeinen <tomi.valkeinen@ti.com>=
 wrote:
>> Hi,
>>
>> Thanks Stephen!
>>
>> Hans, have you had a look at this? kbuild test bot also reported this.=

>=20
> The fix from Stephen should not go to main-line. It breaks simplefb on
> x86 without OF. Imo, linux/clk.h should provide a fallback if OF is
> not defined (like it already does for of_clk_get() and friends).
>=20
> Hans, any comments?

Hans, ping.

 Tomi



--7SbroNTaIbo90i1sg8Jm47TX9hLgKk5fH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUdGFfAAoJEPo9qoy8lh711u0P/RGP5gYpV96vYKYsonQ3Ol1X
Ggsnoad4qrWFIwlTJijwGfkSr4Sm8F0Z4YYvCApaMQ63r0fnCZmPbL8j/IGcbbRz
2Q3UCEwLOriLaBnWPvviXa02q34pmDGdGc/Lhx/sUphNrzuGuI2toPR0SA9aVn2Y
3Wvns4Y+Ke/EnR8QN/CQXICO1eUKAuRybhaxTzhHq/jjIP0gTrnUzn/OEtxvWFbA
LiCMWdGOrdZI9DfkVLRgbQYZzYfzefIvHal0rr8NzHSFkMpYP6WUb3AybgHvNIin
ZMGZXkGWQ2dXehXgVA4HRy7trnI55an286sxOvR2oRnvWRRjwsA6JZcZGiQ3rXAe
t+nD14PPnhCn1L15HhzwHSeit9AGGSgj7XdnPsRNs75ZeRG9lAIsrEjlhJjNypbD
dw7hDbmdjIBz4PzwqOm+kmZVqhsTAgkiP1LLsrrqTuNpfMr4tEa/tIPDlk6+bjW0
vW5+FtBr7oX+Y8uEyeZOUcV3HROeRnbe4a7FsZuNGQtt7xwLqyNog4wqyoFqA/WT
rBAa8QHsVhO6QKHpJHD0zF3ArUAcsVd54qh3J1btdaSk3LOwC9UyNcJESU4FSn1e
0SGyqm4E2VhxIWrS/nAr010FNtODzxkvPoftmjy+H4B7byxE+7FQoFTduNtrHlDa
5UMMdMuaBtxYq41wzq/2
=LcHG
-----END PGP SIGNATURE-----

--7SbroNTaIbo90i1sg8Jm47TX9hLgKk5fH--
