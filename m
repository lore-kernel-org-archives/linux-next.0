From: Zlatko Calusic <zlatko.calusic@iskon.hr>
Subject: Re: mmotm 2013-01-18-15-48 uploaded
Date: Sat, 19 Jan 2013 11:56:40 +0100
Message-ID: <50FA7BE8.9040906@iskon.hr>
References: <20130118234944.5C99C31C240@corp2gmr1-1.hot.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mxout2.iskon.hr ([213.191.128.81]:46427 "EHLO mxout2.iskon.hr"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751745Ab3ASK4o (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 19 Jan 2013 05:56:44 -0500
In-Reply-To: <20130118234944.5C99C31C240@corp2gmr1-1.hot.corp.google.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Yasuaki Ishimatsu <isimatu.yasuaki@jp.fujitsu.com>
Cc: akpm@linux-foundation.org, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org

On 19.01.2013 00:49, akpm@linux-foundation.org wrote:
> The mm-of-the-moment snapshot 2013-01-18-15-48 has been uploaded to
>
>     http://www.ozlabs.org/~akpm/mmotm/
>

WARNING: vmlinux.o(.text+0x43f025): Section mismatch in reference from 
the function release_firmware_map_entry() to the function 
.meminit.text:firmware_map_find_entry_in_list()
The function release_firmware_map_entry() references
the function __meminit firmware_map_find_entry_in_list().
This is often because release_firmware_map_entry lacks a __meminit
annotation or the annotation of firmware_map_find_entry_in_list is wrong.

-- 
Zlatko
