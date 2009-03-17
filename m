From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: Re: [PATCH next] slob: fix build problem
Date: Tue, 17 Mar 2009 11:27:49 +0300
Message-ID: <a4423d670903170127gb874569x544115958be1e7db@mail.gmail.com>
References: <20090317082549.GA5127@orion>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <20090317082549.GA5127@orion>
Sender: owner-linux-mm@kvack.org
To: Nick Piggin <npiggin@suse.de>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org

2009/3/17 Alexander Beregalov <a.beregalov@gmail.com>:
> mm/slob.c: In function '__kmalloc_node':
> mm/slob.c:480: error: 'flags' undeclared (first use in this function)

Oh, I see yesterday discussion, sorry.

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
