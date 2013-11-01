From: Rob Herring <robherring2@gmail.com>
Subject: Re: linux-next: manual merge of the dt-rh tree with the powerpc tree
Date: Fri, 01 Nov 2013 17:24:42 -0500
Message-ID: <52742A2A.9080008@gmail.com>
References: <20131101162002.4dd386299ec42e8d8d032be2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20131101162002.4dd386299ec42e8d8d032be2@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sudeep KarkadaNagesha <sudeep.karkadanagesha@arm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linuxppc-dev@lists.ozlabs.org
List-Id: linux-next.vger.kernel.org

On 11/01/2013 12:20 AM, Stephen Rothwell wrote:
> Hi Rob,
> 
> Today's linux-next merge of the dt-rh tree got a conflict in 
> arch/powerpc/include/asm/prom.h between commit a3e31b458844 ("of:
> Move definition of of_find_next_cache_node into common code") from
> the powerpc tree and commit 0c3f061c195c ("of: implement
> of_node_to_nid as a weak function") from the dt-rh tree.

Ben, I can pick these 2 patches up instead if you want to drop them
and avoid the conflict.

Rob
