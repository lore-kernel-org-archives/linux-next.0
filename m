From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the netfilter-next tree with the
 netfiler tree
Date: Tue, 16 Apr 2019 11:24:27 +1000
Message-ID: <20190416112427.29c30fd1@canb.auug.org.au>
References: <20190415114051.50e0fad8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/OEqA1.ZtUej_fC=MM_dzKVI"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190415114051.50e0fad8@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Pablo Neira Ayuso <pablo@netfilter.org>, NetFilter <netfilter-devel@vger.kernel.org>, David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Florian Westphal <fw@strlen.de>
List-Id: linux-next.vger.kernel.org

--Sig_/OEqA1.ZtUej_fC=MM_dzKVI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 15 Apr 2019 11:40:51 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the netfilter-next tree got a conflict in:
>=20
>   tools/testing/selftests/netfilter/nft_nat.sh
>=20
> between commit:
>=20
>   51f9960db6ad ("netfilter: nat: fix icmp id randomization")
>=20
> from the netfiler tree and commit:
>=20
>   6978cdb129da ("kselftests: extend nft_nat with inet family based nat ho=
oks")
>=20
> from the netfilter-next tree.
>=20
> I fixed it up (I think, see below) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.
>=20
> --=20
> Cheers,
> Stephen Rothwell
>=20
> diff --cc tools/testing/selftests/netfilter/nft_nat.sh
> index 3194007cf8d1,248905130d5d..000000000000
> --- a/tools/testing/selftests/netfilter/nft_nat.sh
> +++ b/tools/testing/selftests/netfilter/nft_nat.sh
> @@@ -321,7 -346,7 +346,8 @@@ EO
>  =20
>   test_masquerade6()
>   {
>  -	local family=3D$1
>  +	local natflags=3D$1
> ++	local family=3D$2
>   	local lret=3D0
>  =20
>   	ip netns exec ns0 sysctl net.ipv6.conf.all.forwarding=3D1 > /dev/null
> @@@ -352,16 -377,21 +378,21 @@@
>  =20
>   # add masquerading rule
>   ip netns exec ns0 nft -f - <<EOF
> - table ip6 nat {
> + table $family nat {
>   	chain postrouting {
>   		type nat hook postrouting priority 0; policy accept;
>  -		meta oif veth0 masquerade
>  +		meta oif veth0 masquerade $natflags
>   	}
>   }
>   EOF
> + 	if [ $? -ne 0 ]; then
> + 		echo "SKIP: Could not add add $family masquerade hook"
> + 		return $ksft_skip
> + 	fi
> +=20
>   	ip netns exec ns2 ping -q -c 1 dead:1::99 > /dev/null # ping ns2->ns1
>   	if [ $? -ne 0 ] ; then
> - 		echo "ERROR: cannot ping ns1 from ns2 with active ipv6 masquerade $na=
tflags"
>  -		echo "ERROR: cannot ping ns1 from ns2 with active $family masqueradin=
g"
> ++		echo "ERROR: cannot ping ns1 from ns2 with active $family masquerade =
$natflags"
>   		lret=3D1
>   	fi
>  =20
> @@@ -398,26 -428,20 +429,27 @@@
>   		fi
>   	done
>  =20
>  +	ip netns exec ns2 ping -q -c 1 dead:1::99 > /dev/null # ping ns2->ns1
>  +	if [ $? -ne 0 ] ; then
> - 		echo "ERROR: cannot ping ns1 from ns2 with active ipv6 masquerade $na=
tflags (attempt 2)"
> ++		echo "ERROR: cannot ping ns1 from ns2 with active $family masquerade =
$natflags (attempt 2)"
>  +		lret=3D1
>  +	fi
>  +
> - 	ip netns exec ns0 nft flush chain ip6 nat postrouting
> + 	ip netns exec ns0 nft flush chain $family nat postrouting
>   	if [ $? -ne 0 ]; then
> - 		echo "ERROR: Could not flush ip6 nat postrouting" 1>&2
> + 		echo "ERROR: Could not flush $family nat postrouting" 1>&2
>   		lret=3D1
>   	fi
>  =20
> - 	test $lret -eq 0 && echo "PASS: IPv6 masquerade $natflags for ns2"
>  -	test $lret -eq 0 && echo "PASS: $family IPv6 masquerade for ns2"
> ++	test $lret -eq 0 && echo "PASS: $family IPv6 masquerade $natflags for =
ns2"
>  =20
>   	return $lret
>   }
>  =20
>   test_masquerade()
>   {
>  -	local family=3D$1
>  +	local natflags=3D$1
> ++	local family=3D$2
>   	local lret=3D0
>  =20
>   	ip netns exec ns0 sysctl net.ipv4.conf.veth0.forwarding=3D1 > /dev/null
> @@@ -448,16 -472,21 +480,21 @@@
>  =20
>   # add masquerading rule
>   ip netns exec ns0 nft -f - <<EOF
> - table ip nat {
> + table $family nat {
>   	chain postrouting {
>   		type nat hook postrouting priority 0; policy accept;
>  -		meta oif veth0 masquerade
>  +		meta oif veth0 masquerade $natflags
>   	}
>   }
>   EOF
> + 	if [ $? -ne 0 ]; then
> + 		echo "SKIP: Could not add add $family masquerade hook"
> + 		return $ksft_skip
> + 	fi
> +=20
>   	ip netns exec ns2 ping -q -c 1 10.0.1.99 > /dev/null # ping ns2->ns1
>   	if [ $? -ne 0 ] ; then
> - 		echo "ERROR: cannot ping ns1 from ns2 with active ip masquere $natfla=
gs"
>  -		echo "ERROR: cannot ping ns1 from ns2 with active $family masqueradin=
g"
> ++		echo "ERROR: cannot ping ns1 from ns2 with active $family masquere $n=
atflags"
>   		lret=3D1
>   	fi
>  =20
> @@@ -493,19 -522,13 +530,19 @@@
>   		fi
>   	done
>  =20
>  +	ip netns exec ns2 ping -q -c 1 10.0.1.99 > /dev/null # ping ns2->ns1
>  +	if [ $? -ne 0 ] ; then
> - 		echo "ERROR: cannot ping ns1 from ns2 with active ip masquerade $natf=
lags (attempt 2)"
> ++		echo "ERROR: cannot ping ns1 from ns2 with active $family masquerade =
$natflags (attempt 2)"
>  +		lret=3D1
>  +	fi
>  +
> - 	ip netns exec ns0 nft flush chain ip nat postrouting
> + 	ip netns exec ns0 nft flush chain $family nat postrouting
>   	if [ $? -ne 0 ]; then
> - 		echo "ERROR: Could not flush nat postrouting" 1>&2
> + 		echo "ERROR: Could not flush $family nat postrouting" 1>&2
>   		lret=3D1
>   	fi
>  =20
> - 	test $lret -eq 0 && echo "PASS: IP masquerade $natflags for ns2"
>  -	test $lret -eq 0 && echo "PASS: $family IP masquerade for ns2"
> ++	test $lret -eq 0 && echo "PASS: $family IP masquerade $natflags for ns=
2"
>  =20
>   	return $lret
>   }
> @@@ -760,20 -795,25 +809,34 @@@ if [ $ret -eq 0 ];the
>   fi
>  =20
>   reset_counters
> - test_local_dnat
> - test_local_dnat6
> + test_local_dnat ip
> + test_local_dnat6 ip6
> + reset_counters
> + $test_inet_nat && test_local_dnat inet
> + $test_inet_nat && test_local_dnat6 inet
> +=20
> + reset_counters
>  -test_masquerade ip
>  -test_masquerade6 ip6
> ++test_masquerade "" ip
> ++test_masquerade6 "" ip6
> ++
> ++reset_counters
> ++test_masquerade "fully-random" ip
> ++test_masquerade6 "fully-random" ip6
>  +
>  +reset_counters
> - test_masquerade ""
> - test_masquerade6 ""
> ++$test_inet_nat && test_masquerade "" inet
> ++$test_inet_nat && test_masquerade6 "" inet
>  +
>   reset_counters
> - test_masquerade "fully-random"
> - test_masquerade6 "fully-random"
>  -$test_inet_nat && test_masquerade inet
>  -$test_inet_nat && test_masquerade6 inet
> ++$test_inet_nat && test_masquerade "fully-random" ip
> ++$test_inet_nat && test_masquerade6 "fully-random" ip6
>  =20
>   reset_counters
> - test_redirect
> - test_redirect6
> + test_redirect ip
> + test_redirect6 ip6
> + reset_counters
> + $test_inet_nat && test_redirect inet
> + $test_inet_nat && test_redirect6 inet
>  =20
>   for i in 0 1 2; do ip netns del ns$i;done
>  =20

This is now a conflict between the net-next and netfilter trees.

--=20
Cheers,
Stephen Rothwell

--Sig_/OEqA1.ZtUej_fC=MM_dzKVI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAly1LssACgkQAVBC80lX
0GzCbwgAhuX8Qzi35vN93S95FAo5deoACeTL3c25FJl5LMHBQPP+/fuzx9bp8Ra0
clWZVdn+tL5iHlvXIlTGcdwSzYje9DJcWLBjHStYU5kE/rS5qBlHx15PveAJ9O2c
AY2DefNaNE3u+FjHmvp/Sm4riUMC5QuWg8qBwMTXoH4Yog1uqPF+rhG4roKTJtyO
NBVtghrgNTXTUXxbHu1DqPQgM3hGSsqLAYA3qoN7P4T8d5Ayo3dmraHqgFS2gqQv
ZdQ6mRzKUtcrklJ3OkNHCnbUCnTH2c/GYI27p+KM7Fy/lK6zBLU5jIZpTxdNRrXQ
0VLueY6xhbBqTiykSpsUYtT6QDxbVQ==
=2SVA
-----END PGP SIGNATURE-----

--Sig_/OEqA1.ZtUej_fC=MM_dzKVI--
