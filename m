From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the tip tree
Date: Thu, 9 Aug 2018 09:24:20 +1000
Message-ID: <20180809092420.094e8722@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/WssEaKtcwrCAINGXV1YpKj9"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Joerg Roedel <jroedel@suse.de>
List-Id: linux-next.vger.kernel.org

--Sig_/WssEaKtcwrCAINGXV1YpKj9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tip tree, today's linux-next build (x86_64 defconfig)
failed like this:

Invalid absolute R_X86_64_32S relocation: __end_rodata_aligned
/kisskb/src/arch/x86/boot/compressed/Makefile:127: recipe for target 'arch/=
x86/boot/compressed/vmlinux.relocs' failed

Caused by commit

  39d668e04eda ("x86/mm/pti: Make pti_clone_kernel_text() compile on 32 bit=
")

This was a build using gcc 4.6.3.  the i386 defconfig also failed
like this:

Invalid absolute R_386_32 relocation: __end_rodata_aligned

They started failing on next-20180723 (which is the first -next that
contained the above commit).  Sorry that we did not notice this earlier.
At least the i386 defconfig build works with gcc 7.3.1.

You can see the full build results here:
http://kisskb.ellerman.id.au/kisskb/head/6b522b734da2950c368aae668f963b8925=
fb5545/

--=20
Cheers,
Stephen Rothwell

--Sig_/WssEaKtcwrCAINGXV1YpKj9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltre6QACgkQAVBC80lX
0GzhyQgAoMUS/c/3qBLyYgmcQb2mh7XlzeQOhof8GRxWQLifEG8XHkEWd5pVnBfA
j3nF3uM7rMx8e9Y2K0tQlH0rSc3Gkr3GLmOG1ZGqTVl7zaj/h7kOikrMGe7PfT5s
iF90MNxSg6wLHD9pZpZlrmAvm7CGnXugW+DvC/IXkkRU3zJI0DmlkgZpcD/OHjqm
non0wFD88uvDhFugKGkE+0lDbY/imKrbN60RJQPSuj2EBtejlC1SnDa+2IyUNKzt
iMu5Y6+JEJdFhDNSzr9QkEjgaIyhBc8vNYGlnYCWbpe1Y7cHo4t0AMI/o1GUyKY8
ARb7mjnMqQXYS2reMpDnzpbXbhgoiw==
=obHU
-----END PGP SIGNATURE-----

--Sig_/WssEaKtcwrCAINGXV1YpKj9--
