Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5BD921FF25;
	Mon, 13 Jul 2026 14:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783951692; cv=none; b=ALUMOpokKnq5UyBea13vVdHfrEDujBwYGwGTl/1QK1n4L0Y/t8qwr3mkLfNYymJ+U4TTSqFSJwWsVQIKxy1sePtwh6qUug3G5bymWQNOIbRU+hia/0AFkRI8AiXeaL86bjkLkCc5gOi4PQ3iz1apLZLlb2/eQvGJ6GPgMTcaKOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783951692; c=relaxed/simple;
	bh=ZNKoaskhZvmbqng1b3OuqLlhflV8rJjA417FIW2teuU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EhJLlwUU5/BJ4ZAd+kcQ2CbgYFhJhuiyTzwXyJHrWOQfOCvs9M1gRMmOi02DA3IckIo1/MSpY17CZJ4syUX1UULJOaRoCloRQ4YH+9AyIwEXyir5O//mC+jTa37GBic3vd5VBTOxPzd/GXb9/BAwZ7pRsJXAUi3gci4pJIHNPV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N1WFrC24; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N1WFrC24"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09CFB1F00A3D;
	Mon, 13 Jul 2026 14:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783951690;
	bh=MlhMQaJZ+Ez8ZDAABtxf/7Q0t1Zipjfsks8MT5fotrU=;
	h=Date:From:To:Cc:Subject;
	b=N1WFrC2456yUVoFdwmk2EGD3mNGqLQh8IFt5pldKE0xcnAgHLA5pbLuWI+GOqTwgy
	 fdbfCNlJY11b0ORy2HLxBMfLPBdZKiQmyHvc1f7AU10pzEqaPex3HneEBvSLWCfWQO
	 5nk7vs+wfI2WQHB5KDq0Vj9crWERys5h47h2mmzn+cYaKVrOeZE5XrXrbWXS/l2dx2
	 mQWIThFr2jGoWMjwghV4yGPPK45nXuHpZdejyAW/4BfmwGopiMkw9DiU0r4FV65/R9
	 otCJs1fSjcDAuyy4R4si4/X0GmEfXRo/2npcD6DI1VOlQ5wZ+DZfME0c8nV9t8hP6E
	 f4tpEE/ZumaAw==
Date: Mon, 13 Jul 2026 15:08:06 +0100
From: Mark Brown <broonie@kernel.org>
To: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>
Cc: Alice Ryhl <aliceryhl@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Keshav Verma <iganschel@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the char-misc tree with the origin tree
Message-ID: <alTxRkflyqvAaGc-@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mwjvox916m06VYe+"
Content-Disposition: inline


--mwjvox916m06VYe+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the char-misc tree got conflicts in:

  drivers/android/binder/node.rs
  drivers/android/binder/process.rs

between commits:

  6849cabfd30fb ("rust_binder: reject context manager self-transaction")
  bc4a982889787 ("rust_binder: clear freeze listener on node removal")

=66rom the origin tree and commits:

  b9d17aa74ddd7 ("rust_binder: avoid allocating under node_refs for freeze =
listeners")
  521eae8326a18 ("rust_binder: avoid dropping NodeRef in update_ref() under=
 lock")

=66rom the char-misc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

I am really not at all confident in this merge.

diff --combined drivers/android/binder/node.rs
index c10148e9069f3,fb57c0b20888f..0000000000000
--- a/drivers/android/binder/node.rs
+++ b/drivers/android/binder/node.rs
@@@ -9,6 -9,7 +9,7 @@@ use kernel::
      seq_print,
      sync::lock::{spinlock::SpinLockBackend, Guard},
      sync::{Arc, LockedBy, SpinLock},
+     uapi,
  };
 =20
  use crate::{
@@@ -21,6 -22,7 +22,7 @@@
  };
 =20
  use core::mem;
+ use core::ptr;
 =20
  mod wrapper;
  pub(crate) use self::wrapper::CritIncrWrapper;
@@@ -321,7 -323,7 +323,7 @@@ impl Node=20
      /// An id that is unique across all binder nodes on the system. Used =
as the key in the
      /// `by_node` map.
      pub(crate) fn global_id(&self) -> usize {
-         self as *const Node as usize
+         ptr::from_ref(self).addr()
      }
 =20
      pub(crate) fn get_id(&self) -> (u64, u64) {
@@@ -464,7 -466,7 +466,7 @@@
          owner_inner: &mut ProcessInner,
      ) -> Option<DLArc<dyn DeliverToRead>> {
          match self.incr_refcount_allow_zero2one(strong, owner_inner) {
-             Ok(Some(node)) =3D> Some(node as _),
+             Ok(Some(node)) =3D> Some(node as DLArc<dyn DeliverToRead>),
              Ok(None) =3D> None,
              Err(CouldNotDeliverCriticalIncrement) =3D> {
                  assert!(strong);
@@@ -489,8 -491,8 +491,8 @@@
          guard: &Guard<'_, ProcessInner, SpinLockBackend>,
      ) {
          let inner =3D self.inner.access(guard);
-         out.strong_count =3D inner.strong.count as _;
-         out.weak_count =3D inner.weak.count as _;
+         out.strong_count =3D inner.strong.count as u32;
+         out.weak_count =3D inner.weak.count as u32;
      }
 =20
      pub(crate) fn populate_debug_info(
@@@ -498,8 -500,8 +500,8 @@@
          out: &mut BinderNodeDebugInfo,
          guard: &Guard<'_, ProcessInner, SpinLockBackend>,
      ) {
-         out.ptr =3D self.ptr as _;
-         out.cookie =3D self.cookie as _;
+         out.ptr =3D self.ptr as uapi::binder_uintptr_t;
+         out.cookie =3D self.cookie as uapi::binder_uintptr_t;
          let inner =3D self.inner.access(guard);
          if inner.strong.has_count {
              out.has_strong_ref =3D 1;
@@@ -657,44 -659,41 +659,43 @@@
      pub(crate) fn add_freeze_listener(
          &self,
          process: &Arc<Process>,
-         flags: kernel::alloc::Flags,
-     ) -> Result {
-         let mut vec_alloc =3D KVVec::<Arc<Process>>::new();
-         loop {
-             let mut guard =3D self.owner.inner.lock();
-             // Do not check for `guard.dead`. The `dead` flag that matter=
s here is the owner of the
-             // listener, no the target.
-             let inner =3D self.inner.access_mut(&mut guard);
-             let len =3D inner.freeze_list.len();
-             if len >=3D inner.freeze_list.capacity() {
-                 if len >=3D vec_alloc.capacity() {
-                     drop(guard);
-                     vec_alloc =3D KVVec::with_capacity((1 + len).next_pow=
er_of_two(), flags)?;
-                     continue;
-                 }
-                 mem::swap(&mut inner.freeze_list, &mut vec_alloc);
-                 for elem in vec_alloc.drain_all() {
-                     inner.freeze_list.push_within_capacity(elem)?;
-                 }
+         // If the vector needs to be resized, it's done via this argument.
+         vec_alloc: &mut KVVec<Arc<Process>>,
+     ) -> Result<Result<(), usize>> {
+         let mut guard =3D self.owner.inner.lock();
+         // Do not check for `guard.dead`. The `dead` flag that matters he=
re is the owner of the
+         // listener, not the target.
+         let inner =3D self.inner.access_mut(&mut guard);
+         let len =3D inner.freeze_list.len();
+         if len =3D=3D inner.freeze_list.capacity() {
+             if len >=3D vec_alloc.capacity() {
+                 // Request the caller to reallocate.
+                 return Ok(Err((1 + len).next_power_of_two()));
+             }
+             mem::swap(&mut inner.freeze_list, vec_alloc);
+             for elem in vec_alloc.drain_all() {
+                 inner.freeze_list.push_within_capacity(elem)?;
              }
-             inner.freeze_list.push_within_capacity(process.clone())?;
-             return Ok(());
          }
+         inner.freeze_list.push_within_capacity(process.clone())?;
+         Ok(Ok(()))
      }
 =20
 -    pub(crate) fn remove_freeze_listener(&self, p: &Arc<Process>) -> KVVe=
c<Arc<Process>> {
 +    pub(crate) fn remove_freeze_listener(&self, p: &Process) -> KVVec<Arc=
<Process>> {
          let mut guard =3D self.owner.inner.lock();
          let inner =3D self.inner.access_mut(&mut guard);
          let len =3D inner.freeze_list.len();
 -        inner.freeze_list.retain(|proc| !Arc::ptr_eq(proc, p));
 +        inner
 +            .freeze_list
 +            .retain(|proc| !core::ptr::eq::<Process>(&**proc, p));
          if len =3D=3D inner.freeze_list.len() {
              pr_warn!(
                  "Could not remove freeze listener for {}\n",
                  p.pid_in_current_ns()
              );
          }
+         // If the vector is empty it needs to be freed. However, we can't=
 free it here because that
+         // might sleep, so return it to the caller.
          if inner.freeze_list.is_empty() {
              return mem::take(&mut inner.freeze_list);
          }
diff --combined drivers/android/binder/process.rs
index cdd1a90797266,1abeb83684e41..0000000000000
--- a/drivers/android/binder/process.rs
+++ b/drivers/android/binder/process.rs
@@@ -30,9 -30,9 +30,9 @@@ use kernel::
      sync::{
          aref::ARef,
          lock::{spinlock::SpinLockBackend, Guard},
-         Arc, ArcBorrow, CondVar, CondVarTimeoutResult, Mutex, SpinLock, U=
niqueArc,
+         Arc, ArcBorrow, CondVar, CondVarTimeoutResult, SpinLock, UniqueAr=
c,
      },
-     task::Task,
+     task::{Pid, Task},
      uaccess::{UserSlice, UserSliceReader},
      uapi,
      workqueue::{self, Work},
@@@ -259,7 -259,7 +259,7 @@@ impl ProcessInner=20
          let push =3D match wrapper {
              None =3D> node
                  .incr_refcount_allow_zero2one(strong, self)?
-                 .map(|node| node as _),
+                 .map(|node| node as DLArc<dyn DeliverToRead>),
              Some(wrapper) =3D> node.incr_refcount_allow_zero2one_with_wra=
pper(strong, wrapper, self),
          };
          if let Some(node) =3D push {
@@@ -455,7 -455,7 +455,7 @@@ pub(crate) struct Process=20
      // Node references are in a different lock to avoid recursive acquisi=
tion when
      // incrementing/decrementing a node in another process.
      #[pin]
-     node_refs: Mutex<ProcessNodeRefs>,
+     node_refs: SpinLock<ProcessNodeRefs>,
 =20
      // Work node for deferred work item.
      #[pin]
@@@ -510,7 -510,7 +510,7 @@@ impl Process=20
                  cred,
                  inner <- kernel::new_spinlock!(ProcessInner::new(), "Proc=
ess::inner"),
                  pages <- ShrinkablePageRange::new(&super::BINDER_SHRINKER=
),
-                 node_refs <- kernel::new_mutex!(ProcessNodeRefs::new(), "=
Process::node_refs"),
+                 node_refs <- kernel::new_spinlock!(ProcessNodeRefs::new()=
, "Process::node_refs"),
                  freeze_wait <- kernel::new_condvar!("Process::freeze_wait=
"),
                  task: current.group_leader().into(),
                  defer_work <- kernel::new_work!("Process::defer_work"),
@@@ -741,7 -741,7 +741,7 @@@
          } else {
              (0, 0, 0)
          };
-         let node_ref =3D self.get_node(ptr, cookie, flags as _, true, thr=
ead)?;
+         let node_ref =3D self.get_node(ptr, cookie, flags, true, thread)?;
          let node =3D node_ref.node.clone();
          self.ctx.set_manager_node(node_ref)?;
          self.inner.lock().is_manager =3D true;
@@@ -861,14 -861,17 +861,17 @@@
          let handle =3D unused_id.as_u32();
 =20
          // Do a lookup again as node may have been inserted before the lo=
ck was reacquired.
-         if let Some(handle_ref) =3D refs.by_node.get(&node_ref.node.globa=
l_id()) {
-             let handle =3D *handle_ref;
-             let info =3D refs.by_handle.get_mut(&handle).unwrap();
-             info.node_ref().absorb(node_ref);
-             return Ok(handle);
-         }
+         let by_node_slot =3D match refs.by_node.entry(node_ref.node.globa=
l_id()) {
+             rbtree::Entry::Vacant(by_node_slot) =3D> by_node_slot,
+             rbtree::Entry::Occupied(handle_ref) =3D> {
+                 // The node was inserted by another thread while we didn'=
t hold the lock.
+                 let handle =3D handle_ref.get();
+                 let info =3D refs.by_handle.get_mut(handle).unwrap();
+                 info.node_ref().absorb(node_ref);
+                 return Ok(*handle);
+             }
+         };
 =20
-         let gid =3D node_ref.node.global_id();
          let (info_proc, info_node) =3D {
              let info_init =3D NodeRefInfo::new(node_ref, handle, self.int=
o());
              match info.pin_init_with(info_init) {
@@@ -884,6 -887,9 +887,9 @@@
          // first thing in `deferred_release`, process cleanup will not mi=
ss the items inserted into
          // `refs` below.
          if self.inner.lock().is_dead {
+             // Explicitly drop the lock so that `info_proc` and `info_nod=
e` are dropped outside of
+             // the lock.
+             drop(refs_lock);
              return Err(ESRCH);
          }
 =20
@@@ -891,7 -897,7 +897,7 @@@
          // `info_node` into the right node's `refs` list.
          unsafe { info_proc.node_ref2().node.insert_node_info(info_node) };
 =20
-         refs.by_node.insert(reserve1.into_node(gid, handle));
+         by_node_slot.insert(handle, reserve1);
          by_handle_slot.insert(info_proc, reserve2);
          unused_id.acquire();
          Ok(handle)
@@@ -900,11 -906,7 +906,11 @@@
      pub(crate) fn get_transaction_node(&self, handle: u32) -> BinderResul=
t<NodeRef> {
          // When handle is zero, try to get the context manager.
          if handle =3D=3D 0 {
 -            Ok(self.ctx.get_manager_node(true)?)
 +            let node_ref =3D self.ctx.get_manager_node(true)?;
 +            if core::ptr::eq(self, &*node_ref.node.owner) {
 +                return Err(EINVAL.into());
 +            }
 +            Ok(node_ref)
          } else {
              Ok(self.get_node_from_handle(handle, true)?)
          }
@@@ -946,15 -948,17 +952,17 @@@
 =20
          // To preserve original binder behaviour, we only fail requests w=
here the manager tries to
          // increment references on itself.
-         let _to_free_freeze_listener;
-         let _to_free_freeze_listener_cleanup;
+         let _to_free_by_handle;
+         let _to_free_by_node;
          let mut refs =3D self.node_refs.lock();
          if let Some(info) =3D refs.by_handle.get_mut(&handle) {
              if info.node_ref().update(inc, strong) {
                  // Clean up death if there is one attached to this node r=
eference.
-                 if let Some(death) =3D info.death().take() {
+                 //
+                 // We remove the entire `info` below, so no need to remov=
e `death` from `info`.
+                 if let Some(death) =3D info.death().as_ref() {
                      death.set_cleared(true);
-                     self.remove_from_delivered_deaths(&death);
+                     self.remove_from_delivered_deaths(death);
                  }
 =20
                  // Remove reference from process tables, and from the nod=
e's `refs` list.
@@@ -963,16 -967,8 +971,8 @@@
                  unsafe { info.node_ref2().node.remove_node_info(info) };
 =20
                  let id =3D info.node_ref().node.global_id();
-=20
-                 if let Some(freeze) =3D *info.freeze() {
-                     if let Some(fl) =3D refs.freeze_listeners.remove(&fre=
eze) {
-                         _to_free_freeze_listener_cleanup =3D fl.on_proces=
s_cleanup(&self);
-                         _to_free_freeze_listener =3D fl;
-                     }
-                 }
-=20
-                 refs.by_handle.remove(&handle);
-                 refs.by_node.remove(&id);
+                 _to_free_by_handle =3D refs.by_handle.remove_node(&handle=
);
+                 _to_free_by_node =3D refs.by_node.remove_node(&id);
                  refs.handle_is_present.release_id(handle as usize);
 =20
                  if let Some(shrink) =3D refs.handle_is_present.shrink_req=
uest() {
@@@ -1299,7 -1295,10 +1299,10 @@@
 =20
          // Update state and determine if we need to queue a work item. We=
 only need to do it when
          // the node is not dead or if the user already completed the deat=
h notification.
-         if death.set_cleared(false) {
+         let should_schedule =3D death.set_cleared(false);
+         drop(refs);
+=20
+         if should_schedule {
              if let Some(death) =3D ListArc::try_from_arc_or_drop(death) {
                  let _ =3D thread.push_work_if_looper(death);
              }
@@@ -1382,19 -1381,17 +1385,17 @@@
              // SAFETY: We are removing the `NodeRefInfo` from the right n=
ode.
              unsafe { info.node_ref2().node.remove_node_info(info) };
 =20
-             // Remove all death notifications from the nodes (that belong=
 to a different process).
-             let death =3D if let Some(existing) =3D info.death().take() {
-                 existing
-             } else {
-                 continue;
-             };
-             death.set_cleared(false);
+             // Clear death notifications from the nodes (that belong to a=
 different process).
+             // No need to remove them from `info` as we clear info below.
+             if let Some(death) =3D info.death().as_ref() {
+                 death.set_cleared(false);
+             }
          }
 =20
          // Clean up freeze listeners.
          let freeze_listeners =3D take(&mut self.node_refs.lock().freeze_l=
isteners);
          for listener in freeze_listeners.values() {
 -            listener.on_process_exit(&self);
 +            listener.on_process_cleanup(&self);
          }
          drop(freeze_listeners);
 =20
@@@ -1536,13 -1533,13 +1537,13 @@@ fn get_frozen_status(data: UserSlice) -
 =20
      for ctx in crate::context::get_all_contexts()? {
          ctx.for_each_proc(|proc| {
-             if proc.task.pid() =3D=3D info.pid as _ {
+             if proc.task.pid() =3D=3D info.pid as Pid {
                  found =3D true;
                  let inner =3D proc.inner.lock();
                  let txns_pending =3D inner.txns_pending_locked();
-                 info.async_recv |=3D inner.async_recv as u32;
-                 info.sync_recv |=3D inner.sync_recv as u32;
-                 info.sync_recv |=3D (txns_pending as u32) << 1;
+                 info.async_recv |=3D u32::from(inner.async_recv);
+                 info.sync_recv |=3D u32::from(inner.sync_recv);
+                 info.sync_recv |=3D u32::from(txns_pending) << 1;
              }
          });
      }

--mwjvox916m06VYe+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpU8UUACgkQJNaLcl1U
h9D39Af/Vdxr62RAVVRfCeyL5mdYWof/trdGvi6LWzU7AO/E8gLo3sb3+eUx/Z8w
U6BVqIUEiAgXsG1TydVFy6TJvZ8jz4dpUIIj0sFxqu48Q//qDArwEUZ0THCQIBP6
ryYoxCPFH+dRh/MyR1tg7PtaqORt4xhqZzJA7NLSNmb5KG9m9Vszqq9OIIl1BfsM
EJbLsTsxlF65s0v79E6ZXsQrZgDEbl/hirZaLnjsPlQzfMpNLE9FsjbmHQw2uQM1
ImhfS9O89tlCN1QyB1dLIZ+6DlEPosl6ZbkceZs1DCq3DOxnVYGfgLn7a0/P7xvL
2icyteH9xZa+eLpEGf8Qdjm7aUq/eA==
=a4bR
-----END PGP SIGNATURE-----

--mwjvox916m06VYe+--
