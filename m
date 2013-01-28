From: Lan Tianyu <tianyu.lan@intel.com>
Subject: Re: linux-next: build failure after merge of the usb tree
Date: Mon, 28 Jan 2013 22:50:14 +0800
Message-ID: <51069026.5070703@intel.com>
References: <20130128214644.a3906eecaf9123b05216dcaf@canb.auug.org.au> <20130128144508.GA2997@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130128144508.GA2997@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <gregkh@linuxfoundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On 2013/1/28 22:45, Greg KH wrote:
> On Mon, Jan 28, 2013 at 09:46:44PM +1100, Stephen Rothwell wrote:
>> Hi Greg,
>>
>> After merging the usb tree, today's linux-next build (x86_64 allmodconfig)
>> failed like this:
>>
>> drivers/usb/core/usb-acpi.c: In function 'usb_acpi_register_power_resources':
>> drivers/usb/core/usb-acpi.c:226:2: error: implicit declaration of function 'acpi_power_resource_register_device' [-Werror=implicit-function-declaration]
>> drivers/usb/core/usb-acpi.c: In function 'usb_acpi_unregister_power_resources':
>> drivers/usb/core/usb-acpi.c:234:3: error: implicit declaration of function 'acpi_power_resource_unregister_device' [-Werror=implicit-function-declaration]
>>
>> Caused by commit 88bb965ed711 ("usb: Register usb port's acpi power
>> resources").
>>
>> I have used the usb tree from next-20130125 for today.
>
> Lan, please send me a patch to resolve this issue.
>
> Stephen, sorry for the breakage.
>
	Sorry for this, I am working on this. Stephen, Thanks for reminder.


> thanks,
>
> greg k-h
>

-- 
Best Regards
Tianyu Lan
linux kernel enabling team
