From: Fabio Estevam <festevam@gmail.com>
Subject: Re: 1f324e3 ipv6: Don't depend on per socket memory for neighbour
 discovery messages
Date: Sat, 31 Aug 2013 18:05:09 -0300
Message-ID: <CAOMZO5BSw6rf6xEeBiJ2zRqTenV1hHbU1+LSv==M0KL6XCp2ig@mail.gmail.com>
References: <5220F691.4020808@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ve0-f175.google.com ([209.85.128.175]:37812 "EHLO
	mail-ve0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753916Ab3HaVFN (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 31 Aug 2013 17:05:13 -0400
In-Reply-To: <5220F691.4020808@wwwdotorg.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Thomas Graf <tgraf@suug.ch>, Eric Dumazet <eric.dumazet@gmail.com>, Hannes Frederic Sowa <hannes@stressinduktion.org>, "David S. Miller" <davem@davemloft.net>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>

Hi Stephen,

On Fri, Aug 30, 2013 at 4:46 PM, Stephen Warren <swarren@wwwdotorg.org> wrote:
> Commit 1f324e3 "ipv6: Don't depend on per socket memory for neighbour
> discovery messages" appears to cause issues for me. If I run

This commit has been reverted in 'net' tree:
https://git.kernel.org/cgit/linux/kernel/git/davem/net.git/commit/?id=25ad6117e73656071b38fd19fa67ae325471c758
