From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: linux-next: Tree for Oct 31 (vboxguest)
Date: Wed, 31 Oct 2018 17:50:47 +0100
Message-ID: <560c85c8-1ee2-31b0-3148-a08f56a25a2e@redhat.com>
References: <20181031145907.1ee2e866@canb.auug.org.au>
 <661e44c7-396a-6d58-efa7-ed292f2677c6@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <661e44c7-396a-6d58-efa7-ed292f2677c6@infradead.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: linux-next.vger.kernel.org

Hi,

On 31-10-18 16:51, Randy Dunlap wrote:
> On 10/30/18 8:59 PM, Stephen Rothwell wrote:
>> Hi all,
>>
>> Please do not add any v4.21/v5.1 code to your linux-next included trees
>> until after the merge window closes.
>>
>> Changes since 20181030:
>>
> 
> 
> on i386:
> 
> ld: drivers/virt/vboxguest/vboxguest_core.o: in function `vbg_ioctl_hgcm_call':
> vboxguest_core.c:(.text+0x212b): undefined reference to `vbg_hgcm_call32'

Are you perhaps using weird compiler options?

This call should be optimized out on i386 (and we rely on calls being
removed be dead code elimination to avoid #ifdefs in various places,
iow this is a normal thing to rely on) :

First we have:

	bool f32bit = false;

...

         switch (req_no_size) {
#ifdef CONFIG_COMPAT
         case VBG_IOCTL_HGCM_CALL_32(0):
                 f32bit = true;
                 /* Fall through */
#endif
         case VBG_IOCTL_HGCM_CALL(0):
                 return vbg_ioctl_hgcm_call(gdev, session, f32bit, data);
	}

And then we also have:

static int vbg_ioctl_hgcm_call(struct vbg_dev *gdev,
                                struct vbg_session *session, bool f32bit,
                                struct vbg_ioctl_hgcm_call *call)
{
	...

         if (f32bit)
                 ret = vbg_hgcm_call32(gdev, client_id,
                                       call->function, call->timeout_ms,
                                       VBG_IOCTL_HGCM_CALL_PARMS32(call),
                                       call->parm_count, &call->hdr.rc);
         else
                 ret = vbg_hgcm_call(gdev, client_id,
                                     call->function, call->timeout_ms,
                                     VBG_IOCTL_HGCM_CALL_PARMS(call),
                                     call->parm_count, &call->hdr.rc);
}

So on i386 CONFIG_COMPAT is never set, this f32bit is a 0 const
and the compiler removes the if branch of the if ... else ...

This has been upstream like this since 4.16 without any problems sofar.

Regards,

Hans
