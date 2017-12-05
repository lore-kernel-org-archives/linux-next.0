From: Chris Metcalf <cmetcalf@mellanox.com>
Subject: Re: linux-next: remove the tile tree?
Date: Mon, 4 Dec 2017 20:33:59 -0500
Message-ID: <d7d86b08-0c9b-6261-5860-712db6eadcee@mellanox.com>
References: <20171205072541.6c30d7b9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-eopbgr20052.outbound.protection.outlook.com ([40.107.2.52]:13455
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751380AbdLEBeO (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 4 Dec 2017 20:34:14 -0500
In-Reply-To: <20171205072541.6c30d7b9@canb.auug.org.au>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On 12/4/2017 3:25 PM, Stephen Rothwell wrote:
> Hi Chris,
>
> Given commit
>
>    8ee5ad1d4c0b ("arch/tile: mark as orphaned")
>
> in Linus' tree, should I remove the tile tree from linux-next?

Yes, that would make sense.  Good catch!

-- 
Chris Metcalf, Mellanox Technologies
http://www.mellanox.com
