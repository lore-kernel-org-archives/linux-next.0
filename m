From: Wolfgang Grandegger <wg@grandegger.com>
Subject: Re: linux-next: net tree build warning
Date: Tue, 09 Jun 2009 15:14:38 +0200
Message-ID: <4A2E603E.3040603@grandegger.com>
References: <20090609203639.96e503fe.sfr@canb.auug.org.au>	<4A2E46A7.6020302@grandegger.com> <20090609.042625.194310688.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S932376AbZFINOw@vger.kernel.org>
In-Reply-To: <20090609.042625.194310688.davem@davemloft.net>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>
Cc: sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

David Miller wrote:
> From: Wolfgang Grandegger <wg@grandegger.com>
> Date: Tue, 09 Jun 2009 13:25:27 +0200
> 
>> [PATCH] can: sja1000_of_platform: fix build problems with printk format
>>
>> Variables of type size_t should be printed with the format "%zx".
>>
>> Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
> 
> It's not a "size_t", it's a "resource_size_t" which can be
> "unsigned long long" on some platforms.

Right, but I assume that the %zx handles that type properly as well.
Should I send a patch with a corrected patch description?

Wolfgang.
