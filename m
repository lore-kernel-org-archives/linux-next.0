From: Dan Williams <dan.j.williams@intel.com>
Subject: Re: linux-next: Fixes tag needs some work in the nvdimm-fixes tree
Date: Mon, 8 Apr 2019 08:08:23 -0700
Message-ID: <CAPcyv4g0WsHf460jJZHyS6k=YvUU4WVfXZq3cJc5b_NUVoHqQg@mail.gmail.com>
References: <20190408155257.7b82b64f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190408155257.7b82b64f@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Li RongQing <lirongqing@baidu.com>, Liang ZhiCheng <liangzhicheng@baidu.com>
List-Id: linux-next.vger.kernel.org

On Sun, Apr 7, 2019 at 10:53 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi Dan,
>
> In commit
>
>   7c33bd4e3e97 ("libnvdimm/pmem: fix a possible OOB access when read and write pmem")
>
> Fixes tag
>
>   Fixes: 98cc093cba1e "(block, THP: make block_device_operations.rw_page support THP)"
>
> has these problem(s):
>
>   - Subject does not match target commit subject
>     Just use
>         git log -1 --format='Fixes: %h ("%s")'

Thanks for the heads up Stephen, will get this fixed.
