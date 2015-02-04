From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: Re: linux-next: build warning after merge of the akpm-current tree
Date: Wed, 04 Feb 2015 08:53:21 +0100
Message-ID: <54D1CFF1.60300@siemens.com>
References: <20150204184818.0fe47255@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150204184818.0fe47255@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 2015-02-04 08:48, Stephen Rothwell wrote:
> Hi Andrew,
> 
> After merging the akpm-current tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
> 
> warning: (GDB_SCRIPTS) selects DEBUG_INFO which has unmet direct dependencies (DEBUG_KERNEL && !COMPILE_TEST)
> warning: (GDB_SCRIPTS) selects DEBUG_INFO which has unmet direct dependencies (DEBUG_KERNEL && !COMPILE_TEST)
> 
> Introduced by commit 3cf8bb219e44 ("scripts/gdb: add infrastructure").

I've posted a fix earlier today [1]. The Intel test robot informed me
already.

Jan

[1] http://thread.gmane.org/gmane.linux.kernel/1881832

- -- 
Siemens AG, Corporate Technology, CT RTC ITP SES-DE
Corporate Competence Center Embedded Linux
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlTRz/EACgkQitSsb3rl5xS3dQCg1ZPql+9XOcaC/hk7WSztRHDb
6JkAn1XATlgzopMoj9KgpbMApDnkKQYc
=Edbi
-----END PGP SIGNATURE-----
