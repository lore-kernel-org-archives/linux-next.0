From: Sebastian Schmidt <yath@yath.de>
Subject: Re: randconfig build error with next-20141113, in fs/pstore/inode.c
Date: Thu, 13 Nov 2014 21:09:34 -0800
Message-ID: <20141114050934.GA7964@moniac.lan.yath.de>
References: <CA+r1ZhjO=kxcyjRb3=d7ozZ_VT9a+iCUy27zPZ2WGVMMzP6OVA@mail.gmail.com>
 <3908561D78D1C84285E8C5FCA982C28F3292CD43@ORSMSX114.amr.corp.intel.com>
 <CAGXu5jLsd3G3+PCwFSUGDxxbfnJwx8G8X4chH0WK21-kv+_ecA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAGXu5jLsd3G3+PCwFSUGDxxbfnJwx8G8X4chH0WK21-kv+_ecA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kees Cook <keescook@chromium.org>
Cc: "Luck, Tony" <tony.luck@intel.com>, "ccross@android.com" <ccross@android.com>, "anton@enomsg.org" <anton@enomsg.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-next <linux-next@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Jim Davis <jim.epost@gmail.com>
List-Id: linux-next.vger.kernel.org

Hi all,

On Thu, Nov 13, 2014 at 11:21:18AM -0800, Kees Cook wrote:
> > This looks to come from your "Honor dmesg_restrict sysctl on dmesg dumps" patch

Oops, you are right.

> > The randconfig doesn't have CONFIG_PRINTK.  I guess we need to provide a stub
> > in <linux/syslog.h> to cover this.
> 
> Without CONFIG_PRINTK, check_syslog_permissions should probably fail.

Kees, I disagree. Without CONFIG_PRINTK, there isn't even a
dmesg_restrict sysctl, so there is no way to turn that on (AFAICS) and
we should retain the default behaviour.

I'll send a patch shortly.

Sebastian
