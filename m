From: Eric Dumazet <eric.dumazet@gmail.com>
Subject: Re: [PATCH] ipv6: Unbreak build
Date: Wed, 09 Oct 2013 07:41:43 -0700
Message-ID: <1381329703.4971.18.camel@edumazet-glaptop.roam.corp.google.com>
References: <1381328067-1593-1-git-send-email-treding@nvidia.com>
	 <1381328067-1593-2-git-send-email-treding@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1381328067-1593-2-git-send-email-treding@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Wed, 2013-10-09 at 16:14 +0200, Thierry Reding wrote:
> IPv6 specific fields in struct sock_common are accessed in various
> places even if IPv6 support is disabled. Fix this by including the
> fields unconditionally.

Well no. There is a reason we keep CONFIG_IPV6 at all.

The right fix is under review :
http://patchwork.ozlabs.org/patch/281784/

Thanks
