From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the tip tree
Date: Tue, 7 Apr 2015 17:18:58 +1000
Message-ID: <20150407171858.2ad46594@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/OXN_PttqjiDk/=tKuU7C_Fl"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alexei Starovoitov <ast@plumgrid.com>, Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <masami.hiramatsu.pt@hitachi.com>
List-Id: linux-next.vger.kernel.org

--Sig_/OXN_PttqjiDk/=tKuU7C_Fl
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tip tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

kernel/events/core.c: In function 'perf_event_set_bpf_prog':
kernel/events/core.c:6732:15: error: 'struct bpf_prog_aux' has no member na=
med 'prog_type'
  if (prog->aux->prog_type !=3D BPF_PROG_TYPE_KPROBE) {
               ^

Caused by commit 2541517c32be ("tracing, perf: Implement BPF programs
attached to kprobes").

I have used the tip tree from next-20150402 for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/OXN_PttqjiDk/=tKuU7C_Fl
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVI4TpAAoJEMDTa8Ir7ZwV8FAP+gOaI0dNS24xa2NZcBvra4w+
jwm8Qbr1YTqQazctGaUGLhLHm5o+4wwX+yshZmFBXLSPatn1bx4GW94XQI+28hbQ
boVhCXF+nMHsGZT59voxpAi1VaQG7svipaBTN0SBvRxgNb/Deog33qq3QN1eknFM
Sqb3+NPcfsbVc2T5pDNkOgwewsIJTpulGowixB0jVHLS73EZTPHceFPX3hB4RkNX
VSzwTVsbDICrvlwoSJRyVrSzcq3ZzKgu01hUoLkqROwn0pPOufU8/00jiVKeCKtQ
bkRxaFFLW/shLcu8JKiFsB8O0spHm3sRKwwRsGa85CawOkqhjsik99zmy4Fq/9Jk
714beYKRmSzpOSpHZuLQSw6o+YiuGLsTwAYlA25uDp0N+nmhdPZ4IFmkFQF9Zsir
DY1JvMM/g/85T6Faepoiw2cIiKdkarF8bFMP2rPlMJsPC3E4mCzMkR3AiHdzLUAu
mSSvqK93TpclhFDHFqq1xQv7KiNJcyL9RjZv66eSl/JZkFbsf3C6M4ulbcdmw50G
yp0sToGHs6V4LFBzDZnV2jg0RzvTOpbwUmDDLwLrzivX1u1GX8t/G69K3FJgnntz
SyQEHmGPD8iTU3QnZBZomK22Vwa37rbYZCzZSeJfzPTl1rxTIYQTr7RNie/2MGoK
XaYOJJf7k5fQdrcf+b8f
=KCsl
-----END PGP SIGNATURE-----

--Sig_/OXN_PttqjiDk/=tKuU7C_Fl--
