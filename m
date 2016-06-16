From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Jun 16 (linux/firmware.h)
Date: Thu, 16 Jun 2016 09:46:43 -0700
Message-ID: <5762D7F3.50802@infradead.org>
References: <20160616154924.1c391bfb@canb.auug.org.au>
 <5762BF6D.2070604@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5762BF6D.2070604@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Stephen Boyd <stephen.boyd@linaro.org>
List-Id: linux-next.vger.kernel.org

[adding Stephen Boyd]

On 06/16/16 08:02, Randy Dunlap wrote:
> On 06/15/16 22:49, Stephen Rothwell wrote:
>> Hi all,
>>
>> Changes since 20160615:
>>
> 
> on i386 and/or x86_64:
> 
> In file included from ../drivers/fpga/fpga-mgr.c:21:0:
> ../include/linux/firmware.h:82:1: error: expected identifier or ( before { token
>  {
>  ^
> 
> 

See:

static inline int request_firmware_into_buf(const struct firmware **firmware_p,
	const char *name, struct device *device, void *buf, size_t size);
{
	return -EINVAL;
}


-- 
~Randy
