From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-integrity
Date: Fri, 6 Jun 2014 17:21:09 +1000
Message-ID: <20140606172109.26f59fdd@canb.auug.org.au>
References: <1402026956.5458.130.camel@dhcp-9-2-203-236.watson.ibm.com>
	<20140606142255.76bc38f1@canb.auug.org.au>
	<1402031469.5458.162.camel@dhcp-9-2-203-236.watson.ibm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/v.jye7URIh=/91GY/HctXj3"; protocol="application/pgp-signature"
Return-path: <linux-security-module-owner@vger.kernel.org>
In-Reply-To: <1402031469.5458.162.camel@dhcp-9-2-203-236.watson.ibm.com>
Sender: linux-security-module-owner@vger.kernel.org
To: Mimi Zohar <zohar@linux.vnet.ibm.com>
Cc: linux-next <linux-next@vger.kernel.org>, linux-security-module <linux-security-module@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/v.jye7URIh=/91GY/HctXj3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Mimi,

On Fri, 06 Jun 2014 01:11:09 -0400 Mimi Zohar <zohar@linux.vnet.ibm.com> wr=
ote:
>
> On Fri, 2014-06-06 at 14:22 +1000, Stephen Rothwell wrote:=20
> >=20
> > On Thu, 05 Jun 2014 23:55:56 -0400 Mimi Zohar <zohar@linux.vnet.ibm.com=
> wrote:
> > >
> > > Please include
> > > git://git.kernel.org/pub/scm/linux/kernel/git/zohar/linux-integrity
> > > #next in linux-next.
> >=20
> > OK, it would be good to know what that tree is about=20
>=20
> The linux-integrity measures, appraises and enforces local file
> integrity, and audit logs file hashes based on policy.  The
> linux-integrity subsystem is upstreamed and pulled into linux-next via
> linux-security.  A suggestion was made to have the linux-integrity
> subsystem pulled directly into linux-next.
>=20
> > ... also it is
> > really late for inclusion in v3.16 even - I generally do not add trees
> > to linux-next during the merge window.  This does not mean I won't
> > include it if you can convince me otherwise ...
>=20
> 8 patches, mostly bugs fixes, are queued to be upstreamed
> http://marc.info/?l=3Dlinux-security-module&m=3D140128032831578&w=3D2
> Please add the linux-integrity subsystem at the next feasible
> opportunity.=20

I was unaware of the other discussion, so no worries - I will add your
tree from Tuesday (as Monday is a Public Holiday here).  I hope that
will help.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/v.jye7URIh=/91GY/HctXj3
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBCAAGBQJTkWvqAAoJEMDTa8Ir7ZwVPSgP/RdCrALO0Rj66tfaDUhS3Hxs
lpCxQqAoNosMV6APc8WV9Al8v6p8oIDonmv5rM6kCp6kK5uAzQJjgCO/243t6VSq
tWRG9IwnHovPGg3/rKsn+ov0TqOfZJon4zg2ey8roOwwOFm3k/8zUCQ+9OiE20Xw
Lebq98WufPv48TxxSs3fdhjTtQ50PfwJrYq0VddFpv2+DnLEq4VUNVlNUa0hg3Bv
BPXDAmwawtcOvntLZtQjNstu7RcfeEzgBaxNFiSPcbtCKU3I1TdQVOvYzwHGD03i
eMDGAKY8Ql8PXkTUX7066jtG0TTZi4ZTAuZr5CC5XgPkCQngcJWxXlu/c1Mp0uG7
q+S73s/sSdb3hdWSDotuaqs1kQXzbM5mRu2im+trzFrNTIq58tcWaLdIP4RcC8nF
hxNVuE2KojTbnqg/AgutiUsnmi+nSvrlwl1eKzSibwXwfel0InwTWM2FnCRV0zHj
r/QRMjVc6CX5EIozBiOjB1xVSvN1geMlcchA/N6MKVaLlGuvoaPmgwmgIPmptFbM
nqE6PsZeqK51WoDHFuBm1WUm24+wZINl4pQg+XlkG7kRb5oMxoZnwuxxf1UiXBQj
kmIngdcgTtXSplhIw9y9HrPrsCQ5f8rcPxfg6A3966AShJuluBm14YBAzWs6Mw3L
CaXuXZD/VF/8uQBMU8d8
=9X/a
-----END PGP SIGNATURE-----

--Sig_/v.jye7URIh=/91GY/HctXj3--
