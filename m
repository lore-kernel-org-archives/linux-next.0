From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the final tree
 (xen tree related)
Date: Mon, 26 Jul 2010 15:29:08 +1000
Message-ID: <20100726152908.951a95b7.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1033351669=="
Return-path: <xen-devel-bounces@lists.xensource.com>
List-Unsubscribe: <http://lists.xensource.com/mailman/listinfo/xen-devel>,
	<mailto:xen-devel-request@lists.xensource.com?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xensource.com>
List-Help: <mailto:xen-devel-request@lists.xensource.com?subject=help>
List-Subscribe: <http://lists.xensource.com/mailman/listinfo/xen-devel>,
	<mailto:xen-devel-request@lists.xensource.com?subject=subscribe>
Sender: xen-devel-bounces@lists.xensource.com
Errors-To: xen-devel-bounces@lists.xensource.com
To: Jeremy Fitzhardinge <jeremy@goop.org>, Xen Devel <Xen-devel@lists.xensource.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sheng Yang <sheng@linux.intel.com>
List-Id: linux-next.vger.kernel.org

--===============1033351669==
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="PGP-SHA1";
	boundary="Signature=_Mon__26_Jul_2010_15_29_08_+1000_faYTzoTLvToPiG0m"

--Signature=_Mon__26_Jul_2010_15_29_08_+1000_faYTzoTLvToPiG0m
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the final tree, today's linux-next build (i386 defconfig)
failed like this:

arch/x86/built-in.o: In function `init_hypervisor_platform':
(.init.text+0x3ca4): undefined reference to `x86_hyper_xen_hvm'
arch/x86/built-in.o: In function `init_hypervisor_platform':
(.init.text+0x3cad): undefined reference to `x86_hyper_xen_hvm'

Caused by commit bee6ab53e652a414af20392899879b58cd80d033 ("x86: early PV
on HVM features initialization").

I reverted commit 4b9100d12d15c0eaf23d9edc86228e1bdf452dc2 ("Merge branch
'upstream/pvhvm' into upstream/xen") for today (since there were
dependencies on the above commit).
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__26_Jul_2010_15_29_08_+1000_faYTzoTLvToPiG0m
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQEcBAEBAgAGBQJMTR0kAAoJEDMEi1NhKgbsgKUH/0guGh1ynWmgFpcXqz/4vhJO
QvWgeG4+2Jrztq8Le20yZgoGQQM8wb8VpnI5t4iowMtbVUTc3tnEJiQM2KuGRD67
q5zj9o//lZz6AHJOvS35M+Myy5NCuCsI/d85mT2lmhZxKScG1Jpmd8C2tBDCIYk2
rn52t6eO0EP4How3RmPNj7DyhmjyQFVDyHtB68C2ZqecOF8yfyFsviy6ha/hKaoZ
c9vIiyMdHZ/cdulTgxUTpSm3OOATqJlj2hWQDAVpAxgfLg1CMiSU30XR5UI2Uzd4
350rVMiTBA0XZATPmuiw1vMoTAZP/I0iR5f2UtouDvCb55IOg66QtoZ6YIBbhmQ=
=boJ1
-----END PGP SIGNATURE-----

--Signature=_Mon__26_Jul_2010_15_29_08_+1000_faYTzoTLvToPiG0m--


--===============1033351669==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Xen-devel mailing list
Xen-devel@lists.xensource.com
http://lists.xensource.com/xen-devel

--===============1033351669==--
