From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: Starting kvm/qemu guest crash kernel linux-next 0221 tree
Date: Wed, 22 Feb 2017 09:28:21 +0100
Message-ID: <e59d5584-fa25-a925-65b8-7394f51c0390@redhat.com>
References: <20170222015243.bzcnin2xbygak4wl@XZHOUW.usersys.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <kvm-owner@vger.kernel.org>
In-Reply-To: <20170222015243.bzcnin2xbygak4wl@XZHOUW.usersys.redhat.com>
Sender: kvm-owner@vger.kernel.org
To: Xiong Zhou <xzhou@redhat.com>, qemu-devel@nongnu.org, kvm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org



On 22/02/2017 02:52, Xiong Zhou wrote:
> Hi,
> 
> Starting a guest begin to crash kernel on 0221 -next tree.
> 
> It's fine on 0220 tree.

Can you try commits a26d553400b30b6e0389f5c723c0fc6f7ea473da (0221) and
b95234c840045b7c72380fd14c59416af28fcb02 (0220)?

What is the guest and the QEMU command line?

Paolo
