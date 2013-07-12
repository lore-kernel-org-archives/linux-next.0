From: Peter Chen <hzpeterchen@gmail.com>
Subject: Re: linux-next: Tree for Jul 11 (usb/chipidea)
Date: Fri, 12 Jul 2013 09:47:10 +0800
Message-ID: <CAL411-pROGd5y5UoShq=_QHUeHFdM8=kv5r0TRLa5o8T1h1bbQ@mail.gmail.com>
References: <20130711141745.04259271113c165310ec4768@canb.auug.org.au> <51DEFDDF.7050803@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <51DEFDDF.7050803@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, USB list <linux-usb@vger.kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>
List-Id: linux-next.vger.kernel.org

On Fri, Jul 12, 2013 at 2:47 AM, Randy Dunlap <rdunlap@infradead.org> wrote:
> On 07/10/13 21:17, Stephen Rothwell wrote:
>> Hi all,
>>
>> Changes since 20130710:
>>
>
>
> on x86_64:
>
> # CONFIG_USB_GADGET is not set
>
> ERROR: "usb_gadget_map_request" [drivers/usb/chipidea/ci_hdrc.ko] undefined!
> ERROR: "usb_del_gadget_udc" [drivers/usb/chipidea/ci_hdrc.ko] undefined!
> ERROR: "usb_gadget_unmap_request" [drivers/usb/chipidea/ci_hdrc.ko] undefined!
> ERROR: "usb_add_gadget_udc" [drivers/usb/chipidea/ci_hdrc.ko] undefined!
>
>
>
> Full randconfig file is attached.
>
>

Should be fixed with below fix, the problem is the same with host.

http://marc.info/?l=linux-usb&m=137331577204167&w=2

--
BR,
Peter Chen
