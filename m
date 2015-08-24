From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Aug 24 (media/i2c/tc358743.c)
Date: Mon, 24 Aug 2015 07:36:45 -0700
Message-ID: <55DB2BFD.9090309@infradead.org>
References: <20150824215249.41824451@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150824215249.41824451@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-media <linux-media@vger.kernel.org>, Ramakrishnan Muthukrishnan <ram@rkrishnan.org>, Mikhail Khelik <mkhelik@cisco.com>, Mats Randgaard <matrandg@cisco.com>
List-Id: linux-next.vger.kernel.org

On 08/24/15 04:52, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20150821:
> 


on x86_64:

drivers/built-in.o: In function `print_avi_infoframe':
tc358743.c:(.text.unlikely+0x7849): undefined reference to `hdmi_infoframe_unpack'
tc358743.c:(.text.unlikely+0x787e): undefined reference to `hdmi_infoframe_log'


Needs to select HDMI ?


-- 
~Randy
