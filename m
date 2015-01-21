From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: Tree for Jan 20 -- Kernel panic - Unable to mount
 root fs
Date: Wed, 21 Jan 2015 11:06:27 -0800
Message-ID: <54BFF8B3.6060802@roeck-us.net>
References: <20150120232726.GA16913@kria> <1517211.UYLV49hvpg@sifl> <1528536.jyty2pu4Mz@sifl> <20150121004117.GM29656@ZenIV.linux.org.uk> <54BF1292.2080902@roeck-us.net> <20150121033600.GN29656@ZenIV.linux.org.uk> <54BF2496.4000807@roeck-us.net> <20150121043637.GO29656@ZenIV.linux.org.uk> <20150121110539.GA8924@kria> <54BFAA5D.4040108@roeck-us.net> <20150121182905.GQ29656@ZenIV.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <20150121182905.GQ29656@ZenIV.linux.org.uk>
Sender: linux-fsdevel-owner@vger.kernel.org
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: Sabrina Dubroca <sd@queasysnail.net>, Paul Moore <pmoore@redhat.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-audit@redhat.com, Richard Guy Briggs <rgb@redhat.com>
List-Id: linux-next.vger.kernel.org

On 01/21/2015 10:29 AM, Al Viro wrote:
> On Wed, Jan 21, 2015 at 05:32:13AM -0800, Guenter Roeck wrote:
>> Another data point (though I have no idea if it is useful or what it means):
>>
>> In the working case, path_init sets nd->flags to 0x50 or 0x51.
>> In the non-working case (ie for all files with a '/' in the name),
>> it sets nd->flags to 0x10 or 0x11, even though it is always called
>> with the LOOKUP_RCU bit set in flags.
>
> Umm...  Are those path_init() succeeding or failing?  Note that path_init()
> includes "walk everything except for the last component", so your non-working
> case is "have it walk anything at all".  What's failing there?  path_init()
> or handling the remaining component?
>
path_init() returns -2. Guess that explains the unexpected flags ;-).
The failuere is from
	link_path_walk()
		walk_component()

Guenter

