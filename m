From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: linux-next: Tree for Jul 22
Date: Fri, 22 Jul 2016 20:54:26 -0400
Message-ID: <CAP=VYLrEJGEBG=OiZUwxVA0ujn9OWECRr-X=cz+c+=06Fqz0PA@mail.gmail.com>
References: <20160722171035.1886c8b0@canb.auug.org.au> <CAP=VYLrkNuvwL0T=0ot_3Wk_VpSzdiJ-ZTcGA71D1od6dQRzAg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAP=VYLrkNuvwL0T=0ot_3Wk_VpSzdiJ-ZTcGA71D1od6dQRzAg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Fri, Jul 22, 2016 at 3:28 PM, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:

[...]

>
> For x86-64 allmod, I am seeing this issue for the 1st time today
> in my local builds, even though it doesn't appear in sfr's builds:
>
> FATAL: drivers/input/evbug: sizeof(struct input_device_id)=312 is not
> a modulo of the size of section
> __mod_input__<identifier>_device_table=384.
> Fix definition of struct input_device_id in mod_devicetable.h
> make[2]: *** [__modpost] Error 1
> make[1]: *** [modules] Error 2
> make: *** [sub-make] Error 2
>
> paul@builder:~/git/linux-head$ git describe
> next-20160722
>
> Nothing has touched drivers/input/evbug.c for years...

Circling back to look at this more, it seems to be a result of the
makefiles not clobbering something properly when using the
same build directory from yesterday's next build today.

Once I executed a "make clean" I could not reproduce it.

P.
--
