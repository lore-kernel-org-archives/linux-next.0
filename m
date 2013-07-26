From: Eli Billauer <eli.billauer@gmail.com>
Subject: Re: linux-next: build failure after merge of the staging tree
Date: Sat, 27 Jul 2013 00:22:44 +0300
Message-ID: <51F2E8A4.2010405@gmail.com>
References: <20130726160254.83bbe994219d6ee732c64b7d@canb.auug.org.au>
 <20130726210335.GA2788@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; CHARSET=US-ASCII; format=flowed
Content-Transfer-Encoding: 7BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20130726210335.GA2788@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Hello Greg,

I was just about to submit a patch fixing this issue. Should arrive in a 
few minutes. Sorry.

Will this be the follow-on patch you mentioned for fixing the "sparse 
errors" this driver produced? I'm wasn't sure what you meant with that.

Oddly enough, I failed to repeat the compilation issue with allmodconfig 
on x86_64, but it did appear on allyesconfig. The problem is obvious, 
and it's strange my own test compilations went through even so.

Regards,
    Eli

On 27/07/13 00:03, Greg KH wrote:
> On Fri, Jul 26, 2013 at 04:02:54PM +1000, Stephen Rothwell wrote:
>    
>> Hi Greg,
>>
>> After merging the staging tree, today's linux-next build (x86_64
>> allmodconfig) failed like this:
>>
>> drivers/staging/xillybus/xillybus_pcie.o:(.data+0x6d8): multiple definition of `xillyname'
>> drivers/staging/xillybus/xillybus_core.o:(.data+0x888): first defined here
>>
>> Caused by commit 48bae0507410 ("staging: New driver: Xillybus generic
>> interface for FPGA").
>>
>> I have disabled that driver.
>>      
> I think I need to just always make any new staging driver only build as
> a module, and not allowed to be built into the kernel.  That will save
> you time dealing with this, and me the extra time of marking them all as
> modules-only every time :)
>
> Sorry about this, I'll go fix this up now...
>
> greg k-h
>
>    
