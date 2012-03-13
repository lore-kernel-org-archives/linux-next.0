From: Randy Dunlap <rdunlap-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org>
Subject: Re: linux-next: Tree for Mar 6 (nfs)
Date: Tue, 13 Mar 2012 13:58:53 -0700
Message-ID: <4F5FB50D.60607@xenotime.net>
References: <20120306180746.25c595babf8b5072366cdbec@canb.auug.org.au> <4F566E37.5040009@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-nfs-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4F566E37.5040009-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org>
Sender: linux-nfs-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Randy Dunlap <rdunlap-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org>
Cc: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-nfs-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-next.vger.kernel.org

On 03/06/2012 12:06 PM, Randy Dunlap wrote:

> On 03/05/2012 11:07 PM, Stephen Rothwell wrote:
> 
>> Hi all,
>>
>> Changes since 20120305:
>>
>> The nfs tree lost its build failure.
> 
> 
> 
> fs/nfs/nfs4xdr.c:3438:7: error: 'nfs_debug' undeclared (first use in this function)
> 
> Full randconfig file is attached.
> 


This build error still occurs in linux-next 20120313.

-- 
~Randy
--
To unsubscribe from this list: send the line "unsubscribe linux-nfs" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
