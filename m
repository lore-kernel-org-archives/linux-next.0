From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the net-next tree
Date: Wed, 16 Nov 2016 11:36:47 +1100
Message-ID: <20161116113647.04900939@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Martin KaFai Lau <kafai@fb.com>
List-Id: linux-next.vger.kernel.org

Hi all,

After merging the net-next tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

kernel/bpf/bpf_lru_list.c: In function '__bpf_lru_list_rotate_inactive.isra.3':
kernel/bpf/bpf_lru_list.c:201:28: warning: 'next' may be used uninitialized in this function [-Wmaybe-uninitialized]
  l->next_inactive_rotation = next;
                            ^

Introduced by commit

  3a08c2fd7634 ("bpf: LRU List")

I can't tell if this is a false positive or not.

-- 
Cheers,
Stephen Rothwell
