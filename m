From: Yuanhan Liu <yliu.null@gmail.com>
Subject: Re: [PATCH] Fix the warning related to type check in kfifo.h
Date: Fri, 26 Oct 2012 00:14:21 +0800
Message-ID: <CAGZGoEejN6pxy8=w_-R2Z4hFMtimCuj-mZBeKBHHOsW4xA8u_g@mail.gmail.com>
References: <1351178137-10760-1-git-send-email-weiyang@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1351178137-10760-1-git-send-email-weiyang@linux.vnet.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Wei Yang <weiyang@linux.vnet.ibm.com>
Cc: akpm@linux-foundation.org, sfr@canb.auug.org.au, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, fengguang.wu@intel.com, yuanhan.liu@linux.intel.com
List-Id: linux-next.vger.kernel.org

Hi Yang,

On Thu, Oct 25, 2012 at 11:15 PM, Wei Yang <weiyang@linux.vnet.ibm.com> wrote:
> In d096f3b046, typecheck() replace the original code to check the type
> mismatch for kfifo related macros.
>
> After this patch, there shows several warnings.

Yes, we found those warnings with 0-DAY system. I checked this issue a
little and found the root cause as you stated below.

But, I have one question: why we need do the type check? The prototype
of __kfifo_type is:
unsigned int __kfifo_out(struct __kfifo *fifo,  void *buf, unsigned int len).

As you see, buf is defined as void * type. And I followed that
function a bit and found it uses memcpy() to do the real _out_ things.
So, why we need do check here? memcpy can handle it no matter what
point type it is.

And please feel free to correct me if I'm wrong.

Thanks,
Yuanhan Liu

> This reason is the original
> code use the assignment to check the type. When the left value is a type of
> "void *", then there is no warning. This type of mismatch can be detected by
> typecheck() macro.
