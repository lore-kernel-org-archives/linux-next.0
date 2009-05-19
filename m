From: Borislav Petkov <borislav.petkov@amd.com>
Subject: Re: linux-next: edac-amd tree build failure
Date: Tue, 19 May 2009 19:54:26 +0200
Message-ID: <20090519175426.GC18874@aftab>
References: <20090519171839.19702b81.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1754919AbZESRyn@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20090519171839.19702b81.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Hi Stephen,

On Tue, May 19, 2009 at 05:18:39PM +1000, Stephen Rothwell wrote:
> Hi Boris,
>=20
> Today's linux-next build (x86_64 allmodconfig) failed like this:
>=20
> usr/include/asm/msr.h:5: included file 'asm-x86/cpumask.h' is not exp=
orted
>=20
> Caused by commit 32b946f3cb8b1c5563dc9525fda85049ea26d1ad ("x86: add
> methods for writing of an MSR on several CPUs").

thanks for reporting, I've added a fix for the build failure and update=
d
the #for-next branch for you to pull for the next linux-next release.

--=20
Regards/Gruss,
Boris.

Operating | Advanced Micro Devices GmbH
  System  | Karl-Hammerschmidt-Str. 34, 85609 Dornach b. M=FCnchen, Ger=
many
 Research | Gesch=E4ftsf=FChrer: Thomas M. McCoy, Giuliano Meroni
  Center  | Sitz: Dornach, Gemeinde Aschheim, Landkreis M=FCnchen
  (OSRC)  | Registergericht M=FCnchen, HRB Nr. 43632
