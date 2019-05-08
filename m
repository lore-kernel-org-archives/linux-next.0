From: Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the risc-v tree
Date: Wed, 08 May 2019 15:15:21 -0700 (PDT)
Message-ID: <mhng-11a7c796-1d78-4c6f-8b27-e85a6aab3a45@palmer-si-x1e>
References: <20190509074745.65336288@canb.auug.org.au>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190509074745.65336288@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
List-Id: linux-next.vger.kernel.org

On Wed, 08 May 2019 14:47:45 PDT (-0700), Stephen Rothwell wrote:
> Hi all,
>
> Commits
>
>   da8e7c379659 ("riscv: Support BUG() in kernel module")
>   564bd22ea4e5 ("riscv: Add the support for c.ebreak check in is_valid_bugaddr()")
>   67363778b72c ("riscv: support trap-based WARN()")
>   efd48cf0b393 ("riscv: fix sbi_remote_sfence_vma{,_asid}.")
>   89f7840cf346 ("riscv: move switch_mm to its own file")
>   8c0e1593f15d ("riscv: move flush_icache_{all,mm} to cacheflush.c")
>
> are missing a Signed-off-by from their committer.

Sorry about that, these should be fixed now.
