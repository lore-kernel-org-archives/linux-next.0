From: Jeff Garzik <jeff@garzik.org>
Subject: Re: [PATCH 1/2] net: igb_main.c fix sparse integer as NULL pointer
 warning
Date: Tue, 22 Jul 2008 18:02:06 -0400
Message-ID: <488658DE.8030000@garzik.org>
References: <1216237527.28841.17.camel@brick>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-net-owner@vger.kernel.org>
In-Reply-To: <1216237527.28841.17.camel@brick>
Sender: linux-net-owner@vger.kernel.org
To: Harvey Harrison <harvey.harrison@gmail.com>
Cc: David Miller <davem@davemloft.net>, linux-next <linux-next@vger.kernel.org>, linux-net <linux-net@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Harvey Harrison wrote:
> drivers/net/igb/igb_main.c:388:20: warning: Using plain integer as NULL pointer
> 
> Signed-off-by: Harvey Harrison <harvey.harrison@gmail.com>
> ---
> Appeared between next-20080715->next-20080716
> 
>  drivers/net/igb/igb_main.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

applied 1-2


