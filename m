From: "Michael Chan" <mchan@broadcom.com>
Subject: Re: linux-next: net tree build failure
Date: Mon, 12 Oct 2009 22:14:22 -0700
Message-ID: <C27F8246C663564A84BB7AB34397724217C978403F@IRVEXCHCCR01.corp.ad.broadcom.com>
References: <20091013153308.af56910a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mms1.broadcom.com ([216.31.210.17]:2128 "EHLO mms1.broadcom.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751497AbZJMFPF convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 13 Oct 2009 01:15:05 -0400
In-Reply-To: <20091013153308.af56910a.sfr@canb.auug.org.au>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: 'Stephen Rothwell' <sfr@canb.auug.org.au>, "David S. Miller" <davem@davemloft.net>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Shmulik Ravid - Rabinovitz <shmulikr@broadcom.com>

Stephen Rothwell wrote:

> Hi Dave,
>
> Today's linux-next build (powerpc allyesconfig) failed like this:
>
> drivers/net/cnic.c: In function 'cnic_init_storm_conn_bufs':
> drivers/net/cnic.c:1757: error: implicit declaration of functi
> on 'csum_ipv6_magic'
>
> Caused by commit 71034ba845c9ff219373066f904286c0b7506922 ("cnic: Add
> main functions to support bnx2x devices") which I have
> reverted for today.
>

I think adding #include <net/ip6_checksum.h> will work.  Will send a
patch right away.  Thanks.
