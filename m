From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH] sctp: fix sctp_setsockopt_autoclose compile warning
Date: Wed, 02 Dec 2009 01:17:16 -0800 (PST)
Message-ID: <20091202.011716.144426726.davem@davemloft.net>
References: <20091130094929.GY10897@shell.iptel.org>
	<20091130095250.GZ10897@shell.iptel.org>
	<4B156862.5020903@hp.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1752753AbZLBJRN@vger.kernel.org>
In-Reply-To: <4B156862.5020903@hp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: vladislav.yasevich@hp.com
Cc: andrei@iptel.org, sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sctp@vger.kernel.org
List-Id: linux-next.vger.kernel.org

From: Vlad Yasevich <vladislav.yasevich@hp.com>
Date: Tue, 01 Dec 2009 14:02:58 -0500

> 
> 
> Andrei Pelinescu-Onciul wrote:
>> Fix the following warning, when building on 64 bits:
>> 
>> net/sctp/socket.c:2091: warning: large integer implicitly
>>                         truncated to unsigned type
>> 
>> Signed-off-by: Andrei Pelinescu-Onciul <andrei@iptel.org>
> 
> Ack.

Applied, but please submit networking patches always CC:'d
to netdev@vger.kernel.org otherwise they won't get logged
in patchwork and therefore are most likely to get lost.
