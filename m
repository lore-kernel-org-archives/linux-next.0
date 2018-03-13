From: Kees Cook <keescook@chromium.org>
Subject: Re: linux-next: Tree for Mar 13
Date: Tue, 13 Mar 2018 12:52:42 -0700
Message-ID: <CAGXu5jK=SMR3UsnwuEX3WwQd8WdjgR=94xXzHdBMEGALRr_JOQ@mail.gmail.com>
References: <20180313183326.0e93f359@canb.auug.org.au> <CAMM=eLdZ6adSV6Q0JLkRi9k=7g5o4SEAyGfOm0P_nqw71Jbing@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMM=eLdZ6adSV6Q0JLkRi9k=7g5o4SEAyGfOm0P_nqw71Jbing@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mike Snitzer <snitzer@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bart Van Assche <bart.vanassche@wdc.com>
List-Id: linux-next.vger.kernel.org

On Tue, Mar 13, 2018 at 8:57 AM, Mike Snitzer <snitzer@redhat.com> wrote:
> I had to revert the following commits to get this kernel to build
> (otherwise I got macro expansion errors, using RHEL7
> gcc-4.8.5-28.el7.x86_64):
>
> beb7eb2 kernelh-skip-single-eval-logic-on-literals-in-min-max-v3
> 19ff7e5 kernelh-skip-single-eval-logic-on-literals-in-min-max-v2
> c7c133f kernel.h: skip single-eval logic on literals in min()/max()

Yeah, these need to be dropped from -mm. There isn't a sane solution
at the moment that works fully for all compiler versions. :(

-Kees

-- 
Kees Cook
Pixel Security
