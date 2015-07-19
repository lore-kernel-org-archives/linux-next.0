From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: [PATCH 04/16] MIPS: use struct mips_abi offsets to save FP context
Date: Sat, 18 Jul 2015 20:21:53 -0400
Message-ID: <CAP=VYLr-DAi0TGuDiSZSeceKQ=Bb6Z9UXNZ=eBKVeP0g1SpOhg@mail.gmail.com>
References: <1436540426-10021-1-git-send-email-paul.burton@imgtec.com> <1436540426-10021-5-git-send-email-paul.burton@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1436540426-10021-5-git-send-email-paul.burton@imgtec.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Burton <paul.burton@imgtec.com>
Cc: "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, Matthew Fortune <matthew.fortune@imgtec.com>, Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>, Michael Ellerman <mpe@ellerman.id.au>, LKML <linux-kernel@vger.kernel.org>, Richard Weinberger <richard@nod.at>, James Hogan <james.hogan@imgtec.com>, Andy Lutomirski <luto@amacapital.net>, Markos Chandras <markos.chandras@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>, Manuel Lauss <manuel.lauss@gmail.com>, "Maciej W. Rozycki" <macro@codesourcery.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Fri, Jul 10, 2015 at 11:00 AM, Paul Burton <paul.burton@imgtec.com> wrote:
> When saving FP state to struct sigcontext, make use of the offsets
> provided by struct mips_abi to obtain appropriate addresses for the
> sc_fpregs & sc_fpc_csr fields of the sigcontext. This is done only for
> the native struct sigcontext in this patch (ie. for O32 in CONFIG_32BIT
> kernels or for N64 in CONFIG_64BIT kernels) but is done in preparation
> for sharing this code with compat ABIs in further patches.
>
> Signed-off-by: Paul Burton <paul.burton@imgtec.com>
> ---
>
>  arch/mips/kernel/r4k_fpu.S       | 151 +++++++++++++++++++++------------------
>  arch/mips/kernel/signal-common.h |   6 ++
>  arch/mips/kernel/signal.c        |  85 +++++++++++++++-------
>  3 files changed, 145 insertions(+), 97 deletions(-)
>

 The current version of this in linux-next picked up a booger in transit.

$ git show 6775b4ea74d5922e5310b7b7a902a8fbe61a0c9d|diffstat
 arch/mips/kernel/r4k_fpu.S       |  151 ++++++++++++++++++++-------------------
 arch/mips/kernel/signal-common.h |    6 +
 arch/mips/kernel/signal.c        |   85 ++++++++++++++-------
 index.html                       |   16 ++++
 4 files changed, 161 insertions(+), 97 deletions(-)

Guessing it happened at Ralf's end.

Paul.
--
